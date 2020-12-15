﻿using BLL;
using DTO;
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

namespace LaptopManagement.pages
{
    /// <summary>
    /// Interaction logic for AddUserPage.xaml
    /// </summary>
    public partial class AddUserPage : Page
    {
        private BLL_User bLL_User = new BLL_User();
        private BLL_Role bLL_Role = new BLL_Role();
        private bool gender;
        private ToastViewModel _vm;
        public AddUserPage()
        {
            InitializeComponent();
            _vm = new ToastViewModel();
        }

        private void RadioMale_Checked(object sender, RoutedEventArgs e)
        {
            gender = true;
        }

        private void RadioFmale_Checked(object sender, RoutedEventArgs e)
        {
            gender = false;
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            if (TextBoxFirstName.Text == "" || TextBoxLastName.Text == "" || TextBoxAddress.Text == "")
            {
                _vm.ShowError("Vui lòng nhập đầy đủ thông tin");
            }
            else
            {
                if (PasswordBox.Password.Equals(PasswordBoxConfirm.Password))
                {
                    bLL_User.AddUser(new User(10, TextBoxUserName.Text, Utils.EncryptString(PasswordBox.Password, Utils.passEncode), TextBoxFirstName.Text, TextBoxLastName.Text, gender, DateTime.Parse(DatePickerBirthday.Text), TextBoxAddress.Text, DateTime.Parse(DatePickerJoinDate.Text), false, bLL_Role.getIDByRoleName(ComboBoxRole.Text)));
                    _vm.ShowSuccess("Thêm thành công");
                }
                else
                {
                    _vm.ShowError("Mật khẩu không khớp, vui lòng kiểm tra lại");
                }
            }
        }
    }
}
