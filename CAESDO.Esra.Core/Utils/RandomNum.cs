using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CAESDO.Esra.Core.Utils
{
    class RandomNum
    {
        /// <summary>
        /// The random object. It is automatically initialized with a time
        /// seed. If you only create one object at a time, this is sufficient.
        /// </summary>
        Random _random = new Random();

        /// <summary>
        /// Wrapper method to return the next random number in our
        /// sequence. It is more efficient and more 'random' to
        /// store only one Random object and reuse it.
        /// </summary>
        public int GetRandom()
        {
            return _random.Next();
        }
    }
}
