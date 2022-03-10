using DummyProject.Services.Services;
using Microsoft.AspNetCore.Mvc;

namespace DummyProject.WebApi.Controllers;

[ApiController]
[Route("api/[controller]")]

public class CalculatorController : ControllerBase
{
    private readonly ILogger<CalculatorController> _logger;
    private readonly IDummyCalculator _calculator;

    public CalculatorController(ILogger<CalculatorController> logger, IDummyCalculator calculator)
    {
        _logger = logger;
        _calculator = calculator;
    }
    
    [HttpGet]
    [Route("add")]
    public double GetAdd(double firstNumber, double secondNumber)
    {
        return _calculator.Add(firstNumber, secondNumber);
    }
    [HttpGet]
    [Route("sub")]
    public double GetSub(double firstNumber, double secondNumber)
    {
        return _calculator.Sub(firstNumber, secondNumber);
    }
    [HttpGet]
    [Route("divide")]
    public double GetDivide(double firstNumber, double secondNumber)
    {
        return _calculator.Divide(firstNumber, secondNumber);
    }
    [HttpGet]
    [Route("multiply")]
    public double GetMultiply(double firstNumber, double secondNumber)
    {
        return _calculator.Multiply(firstNumber, secondNumber);
    }

}