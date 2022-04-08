using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Microsoft.Win32;
using System.IO;

namespace WpfApp1.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddGoodPage.xaml
    /// </summary>
    public partial class AddGoodPage : Page
    {
        private Good _currentGood = new Good();
        private string _filePath = null;
        private string _photoName = null;
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"\Images\";
        public AddGoodPage(Good selectedGood)
        {
            InitializeComponent();
            if (selectedGood != null)
            {
                _currentGood = selectedGood;
                TextBoxGoodId.Visibility = Visibility.Hidden;
                TextBlockGoodId.Visibility = Visibility.Hidden;
                int x = selectedGood.GoodId;
                List<Complect> additional = GBEntities.GetContext().Complects.Where(p =>
                p.MainGoodId == selectedGood.GoodId).ToList();
                List<Good> goods = new List<Good>();
                foreach (Complect item in additional)
                {
                    goods.Add(item.Good1);
                }
                ListViewAdditional.ItemsSource = goods;
                _filePath = _currentDirectory + _currentGood.MainPhoto;
            }
            DataContext = _currentGood;
            _photoName = _currentGood.MainPhoto;
            ComboDeveloper.ItemsSource = GBEntities.GetContext().Developers.ToList();
        }

        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentGood.GoodName))
                s.AppendLine("Поле название пустое");
            if (_currentGood.Developer == null)
                s.AppendLine("Выберите производителя");
            if (_currentGood.Price < 0)
                s.AppendLine("Цена не может быть отрицательной");
            if (!string.IsNullOrWhiteSpace(TextBoxHeight.Text))
            {
                double x = 0;
                if (!double.TryParse(TextBoxHeight.Text, out x))
                    s.AppendLine("Высота имеет числовой тип");
                else if (x < 0)
                {
                    s.AppendLine("Высота не может быть отрицательной");
                }
            }
            if (!string.IsNullOrWhiteSpace(TextBoxLength.Text))
            {
                double x = 0;
                if (!double.TryParse(TextBoxLength.Text, out x))
                    s.AppendLine("Длина имеет числовой тип");
                else if (x < 0)
                {
                    s.AppendLine("Длина не может быть отрицательной");
                }
            }
            if (!string.IsNullOrWhiteSpace(TextBoxWidth.Text))
            {
                double x = 0;
                if (!double.TryParse(TextBoxWidth.Text, out x))
                    s.AppendLine("Ширина имеет числовой тип");
                else if (x < 0)
                {
                    s.AppendLine("Ширина не может быть отрицательной");
                }
            }
            if (!string.IsNullOrWhiteSpace(TextBoxWeight.Text))
            {
                double x = 0;
                if (!double.TryParse(TextBoxWeight.Text, out x))
                    s.AppendLine("Вес имеет числовой тип");
                else if (x < 0)
                {
                    s.AppendLine("Вес не может быть отрицательным");
                }
            }
            if (string.IsNullOrWhiteSpace(_photoName))
                s.AppendLine("Фото не выбрано // Пустое");
            return s;
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            List<Complect> additional = GBEntities.GetContext().Complects.Where(p => p.MainGoodId == _currentGood.GoodId).ToList();
            List<Good> goods = new List<Good>();
            foreach (Complect item in additional)
            {
                goods.Add(item.Good1);
            }
            ListViewAdditional.ItemsSource = goods;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            if (_currentGood.GoodId == 0)
            {

                string photo = ChangePhotoName();
                string dest = _currentDirectory + photo;
                File.Copy(_filePath, dest);
                _currentGood.MainPhoto = photo;
                GBEntities.GetContext().Goods.Add(_currentGood);
            }
            try
            {
                if (_filePath != null)
                {
                    string photo = ChangePhotoName();
                    string dest = _currentDirectory + photo;
                    File.Copy(_filePath, dest);
                    _currentGood.MainPhoto = photo;
                }
                GBEntities.GetContext().SaveChanges();
                MessageBox.Show("Запись Изменена");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void BtnEditAdditional_Click(object sender, RoutedEventArgs e)
        {
            if (_currentGood.GoodId != 0)
            {
                Manager.MainFrame.Navigate(new AdditionalGoodsPage(_currentGood));
            }
        }

        private void ListViewAdditional_PreviewMouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (ListViewAdditional.SelectedItems.Count > 0)
            {
                Good good = (sender as ListView).SelectedItem as Good;
                Manager.MainFrame.Navigate(new AddGoodPage(good));
            }
        }

        private void BtnLoad_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                OpenFileDialog op = new OpenFileDialog();
                op.Title = "Select a picture";
                op.Filter = "JPEG Files (*.jpeg)|*.jpeg|PNG Files (*.png)|*.png|JPG Files (*.jpg)|*.jpg|GIF Files (*.gif) | *.gif";
                    if (op.ShowDialog() == true) 
                {
                    FileInfo fileInfo = new FileInfo(op.FileName);
                    if (fileInfo.Length > (1024 * 1024 * 2))
                    {
                        throw new Exception("Размер файла должен быть меньше 2Мб");
                    }
                    ImagePhoto.Source = new BitmapImage(new Uri(op.FileName));
                    _photoName = op.SafeFileName;
                    _filePath = op.FileName;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                _filePath = null;
            }
        
        }

        string ChangePhotoName()
        {
            string x = _currentDirectory + _photoName;
            string photoname = _photoName;
            int i = 0;
            if (File.Exists(x))
            {
                while (File.Exists(x))
                {
                    i++;
                    x = _currentDirectory + i.ToString() + photoname;
                }
                photoname = i.ToString() + photoname;
            }
            return photoname;
        }

    }
}
