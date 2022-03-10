using DummyProject.Services.Services;
using NUnit.Framework;

namespace DummyProject.Services.Tests;

public class Tests
{
    private IDummyCalculator actor;
    

    [SetUp]
    public void Setup()
    {
        actor = new DummyCalculator();
    }

    [Test]
    public void SUM_OF_POSITIVE_NUMBERS()
    {
        const double n1 = 10;
        const double n2 = 15;
        const double expected = 25;

        var result = actor.Add(n1, n2);
        result.Equals(expected);
    }

    [Test]
    public void SUM_OF_NEGATIVE_NUMBERS()
    {
        const double n1 = -5;
        const double n2 = -10;
        const double expected = -15;

        var result = actor.Add(n1, n2);
        result.Equals(expected);
    }

    [Test]
    public void SUM_OF_NEGATIVE_AND_POSITIVE_NUMBERS()
    {
        const double n1 = -3;
        const double n2 = 3;
        const double expected = 0;
        var result = actor.Add(n1, n2);
        result.Equals(expected);
        
    }
    
    [Test]
    public void SUM_OF_N1_AND_N2_SHOULD_BE_FAIL()
    {
        const double n1 = -3;
        const double n2 = -3;
        const double expected = -9;
        var result = actor.Multiply(n1, n2);
        Assert.AreNotEqual(expected: expected, result);
    }

    [Test]
    public void THE_RESULT_SHOULD_BE_NaN()
    {
        const double n1 = 0;
        const double n2 = 0;

        var result = actor.Divide(n1, n2);
        Assert.IsNaN(result);
    }
}