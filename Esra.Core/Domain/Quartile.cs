using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    public class Quartile : DomainObject
    {
        private QuartileType _QuartileType;

        public virtual QuartileType QuartileType
        {
            get { return _QuartileType; }
            set { _QuartileType = value; }
        }

        private double _Annual;

        public virtual double Annual
        {
            get { return _Annual; }
            set { _Annual = value; }
        }

        private double _Monthly;

        public virtual double Monthly
        {
            get { return _Monthly; }
            set { _Monthly = value; }
        }

        private double _Hourly;

        public virtual double Hourly
        {
            get { return _Hourly; }
            set { _Hourly = value; }
        }

        public Quartile()
        {
        }
    }
}