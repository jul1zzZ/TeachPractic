   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:WpfApp1.PagesWpfApp1.Pages  5      &     WpfApp1.Pages.CatalogOfGoodsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:WpfApp1.Pages     5      -   5          N� Title$  Catalog��5	         	base_page#��[  6@   .��5
      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � $��0��6   $��Stretch=�6!     
additional#��[ 5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $:��4Введите название для поиска:��6     base_textblock#��[ 5      �� 5      -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   5      5      �� 5      $ 
Horizontal=�6   .+�5      �� $1��+Выберите производителя��6   #��[ 5      �� 5      -   5         ��Name$ ComboDeveloper��5   '   $	��275��6    �� DisplayMemberPath$ DeveloperName��5      5      �� 5      $ 
Horizontal=�6   .+�5       �� $!��Сортировать по��6   #��[ 5!      �� 5"      -   5        $ 	ComboSort��5"   '   $	��275��6   .@�5$      �� $!��По возрастанию��6#   �� 5%      $��По убыванию��6#   5&      5'      5(      �� 5)   
   -   5         ��Name$ 
LViewGoods��5)      $��1��6'   $��Disabled=�64     	good_item#��[ 6j   ��5*      �� 5+      .R�5,      �  � Orientation$ 
Horizontal=�6    $��Center=�69   5-      ��5/      �� 50      .R�51      � $��20q�6   $	��300��6'    52      �� 53      $	��310 �6,   �� 54      $
��auto �6,   �� 55      $��20 �6,   .+�57      �� $	��240��6    $��0��6,   $��Uniform=�69   $��Center=�6K   $��5q�6h   ��6s   ��  �� Path$ GetPhoto��� 58      $��1��6%   $	��100��62   .+�59      �� 	 �� Padding$	 3q�6(   $
��Auto��64     item_textblock#��[ 6B   ��5:   "   `� 5;   &   
 �� StringFormat$
 {0}{1}��63   .1�5<   *   �� $ GoodName�62   �� 5=   *   $ GetCount�62   5>   '   5@      �� 5A      $
��Auto��6j   #��[ 5B   (   $��Center=�6P    
 akcent#��[ 5C   (   $
��Bold"�6M   $��20(�6_   ��5A   (   �� *Price+$
 c�� �� ConverterCulture$ ru-RU��5C   _   5D      �� 5E      $
��Auto��6?   #��[ 5F   $   $��2��6L   ��5E   $   �� *	GetStatus+5F   L   5G      5H      5J      �� 5K   
   -   5         ��Name$ TextBlockCount��5K   !   $��2��6   6!   �� 5L   
   -   5        $��2��5L      $
��Next��6   $	��100��6-   $��30��69   6]   5M      5N      