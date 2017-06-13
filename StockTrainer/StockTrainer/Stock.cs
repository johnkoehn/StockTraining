using System;
using System.Collections.Generic;
using System.Text;

namespace StockTrainer
{
    class Stock
    {
        private List<double> prices; //this will be bound by the number of timeperiods we are measuring
        private String id;
        private double movingAvg = 0;
        private double avgDeviation = 0;

        public Stock(String id)
        {
            this.id = id;
        }

        //this method updates all the parameters for tracking a stock
        private void update()
        {
            
        }

        private void updateMovingAvg()
        {
            if (movingAvg != 0)
            {
                movingAvg += prices[prices.Count - 1];
                movingAvg /= 2;
            }
            else
            {
                movingAvg += prices[0];
            }
        }

        private void updateAvgDeviation()
        {
            //take the summation of (prices - medium) and divide by total
            double sum = 0;
            foreach(double price in prices)
            {
                sum += price - movingAvg;
            }
            avgDeviation = sum / prices.Count;
        }

        public double currentPrice()
        {
            return prices[SimulationData.period];
        }

        public double movingAverage()
        {
            return movingAvg;
        }

        public double avgDeviationPercent()
        {
            return 0;
        }

        public void nextPeriod(double price)
        {

        }
    }
}
