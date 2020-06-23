using System;
using System.Collections.Generic;
using System.Text;

namespace Business.Abstract
{
    public class ReturnMessage
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public object Data { get; set; }
    }
}
