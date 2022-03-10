namespace DummyProject.Services.Services;

public class DummyCalculator : IDummyCalculator
{
    public double Add(double n1, double n2)
    {
        return n1 + n2;
    }

    public double Sub(double n1, double n2)
    {
        return n1 - n2;
    }

    public double Divide(double n1, double n2)
    {
        return n1 / n2;
    }

    public double Multiply(double n1, double n2)
    {
        return n1 * n2;
    }
}