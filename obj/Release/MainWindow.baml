   M S B A M L   `   `   `  ���� C  ?WPFNotes, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:WPFNotesWPFNotes      WPFNotes.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     (localclr-namespace:WPFNotes       � Title$  WPFNotes��$	��450��$	��850��$	��850��$	��450�� � 	Resources    SlideInStart �� 
TargetName �� TargetProperty W� From	 W� To g� Duration W� EasingFunction.  (System.Windows.Media.Animation.CubicEase7  1System.Windows.Media.Animation.EasingFunctionBase   
EasingMode  
SlideInEnd%   WPFNotes.SubtractValueConverter  SubtractConverter��%�   &	        &	 c     &	 �     �� .��W� $ TextCreatorAnim��$ Y�$
 -200X�$ 0X�$ 0:0:0.4D�   $ EaseOut=��� .��W� $ TextCreatorAnim��$ Y�$ 0X�$
 -200X�$ 0:0:0.4D�   $ EaseOut=�  .��� .+�� $��	0,0,720,0q�.+��� $
��Left=�$��80��$��Stretch=����� 	 �� 
StartPoint$		 0,0&�
 �� EndPoint$	
 0,1&�.���  � Color$ MediumSeaGreen�� � Offset$ 0Q�� $ 
LightGreen��$ 1Q��� .+��� -   $��Center=�
������ $��0q�$��64��$	��Top=� �� Left$ 10��
 �� Top$ 10��.����  �� CornerRadius$ 15��$��60��$��58������ $		 0,0&�$	
 0,1&�.��� $ SeaGreen��$ 0Q�� $ GreenYellow��$ 1Q�._��� $��Images/NoteIcon.png��$��4,5,4,5q��� -   $��ListOfNotes��$��80,0,0,0q�$
��Auto=�$��Stretch=����� .R��� $��-5, 0, 0, 0q�$��2q�
������._�� -   $��5, 0, 50, 5q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��* �.+��� $��	NoteTitle��$
��Wrap=�$��Arial Rounded MT Bold)�$��22(�$	��Top=�$��0������ *Title+��`�  `� 	Converter# [  `� ConverterParameter$ 70��.1���  �� Path$ ActualWidth� �� RelativeSource ��  �� AncestorType$ ListBoxL��� $��NoteTime��$
��Wrap=�$��Arial Rounded MT Bold)�$��12(�$	��Top=�
�������$��1������ *Time+�� $��NoteContent��$
��Wrap=�$��Arial)�$��16(�$	��Top=�$��2������ *	Content+��`� # [ $ 70��.1��� $ ActualWidth� �� $ ListBoxL��� -   $��25��$��25��$	��Top=�$��Right=�$��0, 2, -45, 0q�$
��Bold"�$��Arial)�
�����������  �� 
TargetType" ��.R��� $ 10������ $		 0,0&�$	
 0,1&�.��� $ MediumSeaGreen��$ 0Q�� $ GreenYellow��$ 1Q�._��� $��Center=�$��Center=�.��✕���� $		 0,0&�$	
 0,1&�.��� $ White��$ 0Q�� $ LightYellow��$ 1Q��� -   $��TextCreator��$��86,8,0,0q�$ 15��$	��Top=�$
��Left=�$	��450��$	��187��._�� $��Center=�$	��450��$	��148��$��Bottom=�.+��� $��Оглавление:��
�������$��20(�$��Arial Rounded MT Bold)�$��10,-19,314,142q��� $��Содержание��
�������$��20(�$��Arial Rounded MT Bold)�$��162,10,162,114q��� -   $��
ContentBox�� �� AcceptsReturn . " �� VerticalScrollBarVisibility$
 Auto=� �� 	MaxLength$	 350��$��10,38,10,41q�$��18(�$��Arial)� �� TextWrapping$
 Wrap=��� -    ��Name$ TitleBox��$ 60��$��136,-22,10,139q�$��18(�$��Arial)�$
 Wrap=��� -   $��351,112,10,8q�
������ $��0q�.���� $ 15��$��24��$��84������ $		 0,0&�$	
 0,1&�.��� $ SeaGreen��$ 0Q�� $ GreenYellow��$ 1Q�._��� $��Center=�$��Center=�$��Arial Rounded MT Bold)�
�������Завершить���� $		 0,0&�$	
 0,1&�.��� $ MediumSeaGreen��$ 0Q�� $ 
LightGreen��$ 1Q�z�T� -	   TextCreatorAnim�� T� Y$
 -200Q�