   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:WpfApp1.PagesWpfApp1.Pages  5      '    !WpfApp1.Pages.AdditionalGoodsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:WpfApp1.Pages     5        N� Title$  Additional Goods��5	         	base_page#��[  6    .��5
      �  � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��2��6.   .+�5      �� $!��Выберите товар��6     base_textblock#��[ 6.   �� 5      -   5         ��Name$ 
ComboGoods��5   5   $��Stretch=�6    �� SelectedValuePath$ GoodId��5       �� DisplayMemberPath$ GoodName��62   5      �� 5   
   $/��)Дополнительные товары��6   $��1��61   $��0��6>   �� 5   
   -   5         ��Name$ ListBoxAdditional��5      $��Visible=�6-   $��Stretch=�5      $ GoodId��5      $��2��6-   $��0��6:   ��5      �� 5      .R�5       �� $��5q�6!   $ 
Horizontal=�6,   .+�5!      ��  ��Name$ 	BtnDelete��6!   -   5        $��-��5!   4   $��20��6@   $��Right=�5"   !   6=   �� 5#      $��60��6    $��60��6+   ��67   �� 	 �� Path$	 GetPhoto��� 5$      .+�5%      �� $��14(�6(   $	��350��5&   a   $
��Left=�6m   ��6(   �� $	 GoodName�
 �� StringFormat$
 Товар: {0}��6m   �� 5'      $��14(�6(   $	��300��5(   _   $
��Left=�6k   ��6(   �� $	 Price�$
 {0:f2} руб.��6k   5)      5*      5+      5-      �� 5.   
   $��Все товары��6   $��1��6&   $��1��63   �� 5/   
   -   5        $ ListBoxAllGoods��5/      $��Visible=�6+   $��Stretch=�50      $ GoodId��51      $��2��6-   $��1��6:   ��52      �� 53      .R�54      �� $��5q�6!   $ 
Horizontal=�6,   .+�55      �� $ BtnAdd��6!   -   5        $��+��55   1   $��20��6=   $��Right=�56   !   6=   �� 57      $��60��6    $��60��6+   ��67   �� $	 GetPhoto��� 58      .+�59      �� $��14(�6(   $	��350��5:   b   $
��Left=�6n   ��6(   �� $	 GoodName�$
 Товар: {0}��6n   �� 5;      $��14(�6(   $	��300��5<   _   $
��Left=�6k   ��6(   �� $	 Price�$
 {0:f2} руб.��6k   5=      5>      5?      5A      5B      5C      