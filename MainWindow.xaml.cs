using System;
using System.IO;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml;

namespace WPFNotes
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        //DoubleAnimation boardAnimStart = new DoubleAnimation
        //{
        //    From = 400,
        //    To = 0,
        //    Duration = TimeSpan.FromSeconds(0.5),
        //    EasingFunction = new CubicEase {  EasingMode = EasingMode.EaseOut }
        //};

        public class Note
        {
            public string Title { get; set; }
            public string Content { get; set; }
            public string Time { get; set; }
        }

        bool isTextBoxOpened, isItEditing;
        TextBlock curTitleBlock, curContentBlock, curTimeBlock;

        public MainWindow()
        {
            InitializeComponent();
            Closing += OnClosing;
            LoadNotes("notes.txt");
        }

        private void OnClosing(object sender, System.ComponentModel.CancelEventArgs e) => SaveNotes("notes.txt");
        public void CreateNote(object sender, RoutedEventArgs e)
        {
            ((Storyboard)FindResource(isTextBoxOpened ? "SlideInEnd" : "SlideInStart")).Begin();
            isTextBoxOpened = !isTextBoxOpened;
            TitleBox.Clear();
            ContentBox.Clear();
            isItEditing = false;
        }

        public void ApplyNote(object sender, RoutedEventArgs e)
        {
            if (ContentBox.Text.Count(x => x == ' ') != ContentBox.Text.Length && TitleBox.Text.Count(x => x == ' ') != TitleBox.Text.Length) 
            {
                if (!isItEditing)
                {
                    Note note = new Note() { Title = TitleBox.Text,  Content = ContentBox.Text, Time = DateTime.Now.ToString() };
                    ListOfNotes.Items.Add(note);
                    CreateNote(sender, e);
                }
                else 
                {
                    if (curTitleBlock.Text != TitleBox.Text || curContentBlock.Text != ContentBox.Text)
                    {
                        curTitleBlock.Text = TitleBox.Text;
                        curContentBlock.Text = ContentBox.Text;
                        curTimeBlock.Text = DateTime.Now.ToString();
                    }
                    ((Storyboard)FindResource("SlideInEnd")).Begin();
                    isTextBoxOpened = false;
                }
                TitleBox.Clear();
                ContentBox.Clear();
            }
        }

        public void EditNote(object sender, RoutedEventArgs e)
        {
            var grid = sender as Grid;
            curTitleBlock = grid.FindName("NoteTitle") as TextBlock;
            curContentBlock = grid.FindName("NoteContent") as TextBlock;
            curTimeBlock = grid.FindName("NoteTime") as TextBlock;
            TitleBox.Text = curTitleBlock.Text;
            ContentBox.Text = curContentBlock.Text;
            ((Storyboard)FindResource("SlideInStart")).Begin();
            isTextBoxOpened = true;
            isItEditing = true;
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        public void DeleteNote(object sender, RoutedEventArgs e)
        {
            Button btn = sender as Button;
            ListBoxItem listBoxItem = ItemsControl.ContainerFromElement(ListOfNotes, btn) as ListBoxItem;
            ListOfNotes.Items.Remove(listBoxItem.Content);
        }

        private void SaveNotes(string filePath)
        {
            List<string> allLines = new List<string>();
            foreach(Note item in ListOfNotes.Items) 
            {
                allLines.Add("Ʊ" + item.Title);
                allLines.Add(item.Time);
                allLines.Add(item.Content);
            }
            if(File.Exists(filePath))
                File.Delete(filePath);
            File.WriteAllLines(filePath, allLines);
        }

        private void LoadNotes(string filePath)
        {
            if (File.Exists(filePath))
            {
                ListOfNotes.Items.Clear();
                string[] lines = File.ReadAllLines(filePath);
                for (int i = 0; i < lines.Length;)
                {
                    Note newNote = new Note() { Title = lines[i].Substring(1), Time = lines[i + 1], Content = lines[i + 2] };
                    for (i += 3; i < lines.Length; i++)
                    {
                        if (lines[i][0] != 'Ʊ')
                            newNote.Content += "\n" + lines[i];
                        else
                            break;
                    }
                    ListOfNotes.Items.Add(newNote);
                }
            }
        }
    }
    public class SubtractValueConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            if (values[0] is double totalWidth && double.TryParse(parameter?.ToString(), out double toSubtract))
            {
                return totalWidth - toSubtract;
            }
            return 0;
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
            => throw new NotImplementedException();
    }
}
