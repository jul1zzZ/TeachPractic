   M S B A M L   `   `   `  ����B  >WpfApp2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp2WpfApp2  5          WpfApp2.TablePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:WpfApp2     5      -   5          N� Title$  	TablePage��5	      .��5
      �  � RowDefinitions 5   
   �� 5      �� 5      $��50 �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ DataGridGood��5         AutoGenerateColumns .     
IsReadOnly . ��6)   �� *Agents+   Columns 5      4  .System.Windows.Controls.DataGridTemplateColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Фамилия��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6:      CellTemplate 5      �� 5      .R�5      �� $
��Wrap=�6(   ��6<   �� *Name+5      5        5      $ Фото��6)    5      �� 5      .R�5      �� $	��100��6@   $	��100��6M   $
��Fill=�6Y   ��6$   �� *
GetPhoto+6Y   5      5        5       $ Имя��6)   $ * 66    5!      �� 5"      .R�5#      �� $
��Wrap=�6(   ��6<   �� *	Surname+5$      5&        5'      $! Номер телефона��6)   $ * 6A    5(      �� 5)      .R�5*      �� $
��Wrap=�6(   ��6<   �� *PhoneNumber+5+      5-        5.      $ Отчество��6)   $ * 6;    5/      �� 50      .R�51      �� $
��Wrap=�6(   ��6<   �� *
Patronymic+52      54        55      $ Просмотр��6)   $ * 6;    56      �� 57      .R�58      �� 	 ��Name$	 AgentInfoBtn��6%   -   5        $��Просмотр��58   ;   6N   59      5;      5=      �� 5?   
   -   5        $	 	BtnDelete��5?      $��1��6$   $	��100��61   $��Right=�5@      $��3q�6-   $��Удалить��5A      6#   �� 5B   
   -   5        $	 BtnAdd��5B      $��1��6!   $	��100��6.   $
��Left=�5C      $��3q�6,   $��Добавить��5D      6$   5E      5F      