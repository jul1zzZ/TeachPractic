   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:WpfApp1.PagesWpfApp1.Pages  5           WpfApp1.Pages.SellGoodPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:WpfApp1.Pages     5        N� Title$
  Sell��5	         	base_page#��[  6   .��5
      �  � ColumnDefinitions 5   
   �� 5      $	��300 �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��2��6.   .+�5      �� $!��Выберите товар��6     base_textblock#��[ 6.   �� 5      -   5         ��Name$ 
ComboGoods��5   5   $��Stretch=�6    �� SelectedValuePath$ GoodId��5       �� DisplayMemberPath$ GoodName��62   5      � 5   
   -   5         �Name$ GridGood��5      $	��300��6!   $��1��6-   $��0��6:    5      �� 5      $	��310 �6    �� 5      $
��auto �6    �� 5      $��20 �6    .+�5      �� $	��240��6   $��0��6    $��Uniform=�6-   $��Center=�5       ��61   ��  �� Path$ GetPhoto��� 5!      $��1��6   $	��100��6&   .+�5"      �� 	 �� Padding$	 3q�6   $
��Auto��6(     item_textblock#��[ 5#      ��5$      `� 5%      
 �� StringFormat$
 {0}{1}��6'   .1�5&      �� $ GoodName�6&   �� 5'      $ GetCount�6&   5(      5*      �� 5+      $
��Auto��6^   #��[ 5,      $��Center=�6D    
 akcent#��[ 5-      $
��Bold"�6A   $��20(�6S   ��5+      �� *Price+$
 c�� �� ConverterCulture$ ru-RU��5-   S   5.      �� 5/      $
��Auto��63   #��[ 50      $��2��6@   ��5/      �� *	GetStatus+50   @   51      &   System.Windows.Controls.DataGrid  52   
   -   5          Name$ DataGridSells��52         AutoGenerateColumns .  $��1��6F   $��1��6S      Columns 53      0  *System.Windows.Controls.DataGridTextColumn  54      ,  &System.Windows.Controls.DataGridColumn   Header$ Дата продажи��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   �� *
DateSell+$
 d��$ ru-RU��  55      $ Количество��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6S    69   �� *Count+6S   57      58      59      