using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace assignment3.Models
{
    public class BirthDateValidation : ValidationAttribute
    {
        public override bool IsValid(object value)

        {
            

            var ageNow = (Convert.ToDateTime(value)).AddYears(18);
           
            return ageNow <= DateTime.Now ;
        }



    }
}
