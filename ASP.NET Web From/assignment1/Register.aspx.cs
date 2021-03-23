using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment1
{
    public partial class Register : System.Web.UI.Page
    {
        /// <summary>
        /// Set input focus to first name text box and clear output literal.
        /// </summary>
        /// <param name="sender">page</param>
        /// <param name="e">event data</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            firstNameTextBox.Focus();
            outputLiteral.Text = "";
        }


        /// <summary>
        /// If the the new player's age is 18 or over, add player's record to the database and reset inputs
        /// </summary>
        /// <param name="sender">submit button</param>
        /// <param name="e">event data</param>
        protected void submitButton_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                DateTime.TryParse(birthdayTextBox.Text, out DateTime birthday);
                DateTime today = DateTime.Today;
                DateTime ageNow = birthday.AddYears(18);
                if( ageNow <= today)
                {
                    try
                    {
                        var connectionString = WebConfigurationManager.ConnectionStrings["HASCConnectionString2"].ConnectionString;
                        using (var connection = new SqlConnection(connectionString))
                        {
                            var command = new SqlCommand("SELECT MAX(person_id) FROM persons", connection);
                            connection.Open();
                            var maxID = command.ExecuteScalar();
                            command.CommandText = "INSERT INTO persons(person_id, first_name, last_name, division_id, email, birth_date, player) " +
                                                  "VALUES(@id, @first, @last, @division, @email, @birthday, @player)";
                            command.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = ((int)maxID) +1 ;
                            command.Parameters.Add("@first", System.Data.SqlDbType.VarChar).Value = firstNameTextBox.Text;
                            command.Parameters.Add("@last", System.Data.SqlDbType.VarChar).Value = lastNameTextBox.Text;
                            command.Parameters.Add("@division", System.Data.SqlDbType.Int).Value = divisionDropDownList.SelectedValue;
                            command.Parameters.Add("@email", System.Data.SqlDbType.VarChar).Value = emailTextBox.Text;
                            command.Parameters.Add("@birthday", System.Data.SqlDbType.VarChar).Value = birthday.ToShortDateString();
                            command.Parameters.Add("@player", System.Data.SqlDbType.Bit).Value = true;
                            command.ExecuteNonQuery();
                        }
                    }
                    catch (Exception ex)
                    {

                        outputLiteral.Text += $"<p style=\"color:red;\">{ex.Message}</p>";
                    }

                    outputLiteral.Text = "<p style=\"color:green;\">Thank you for your interest. The club will be in touch shortly.</p>";                    
                    divisionDropDownList.SelectedIndex = 0;
                    firstNameTextBox.Text = "";
                    lastNameTextBox.Text = "";
                    emailTextBox.Text = "";
                    birthdayTextBox.Text = "";

                }//age >18

                else
                {
                    //outputLiteral.Text = @"<div class=""alert-danger""><p>You must be at least 18 years of age to join the club.<p></div>";
                    outputLiteral.Text = "<p style=\"color:red;\">You must be at least 18 years of age to join the club.</p>";
                    birthdayTextBox.Focus();
                }


            }//IsValid
            
        }
    }
}