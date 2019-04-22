using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSharpDebuggingExtension
{
    // This class does nothing, exists just to get helpful C#-style F12s during development
    class Thunk
    {
        public void Test()
        {
            Func<int, int> f = a => -a;
            var vs = Microsoft.FSharp.Collections.ListModule.OfSeq<int>(new[] { 1, 2, 3 });
            Microsoft.FSharp.Collections.ListModule.Map<int, int>(Microsoft.FSharp.Core.FuncConvert.FromFunc<int, int>(v => f.Invoke(v)), vs);
        }
    }
}
