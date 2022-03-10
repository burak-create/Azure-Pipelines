using Microsoft.AspNetCore.Mvc;

namespace Calculator.Controllers;

[ApiController]
[Route("api/[controller]")]

public class CalculatorController : ControllerBase
{
    private readonly ILogger<CalculatorController> _logger;

    public CalculatorController(ILogger<CalculatorController> logger)
    {
        _logger = logger;
    }
    
    [HttpGet]
    [Route("add")]
    public double GetAdd(double firstNumber, double secondNumber)
    {
        return firstNumber + secondNumber;
    }
    [HttpGet]
    [Route("sub")]
    public double GetSub(double firstNumber, double secondNumber)
    {
        return firstNumber - secondNumber;
    }
    [HttpGet]
    [Route("divide")]
    public double GetDivide(double firstNumber, double secondNumber)
    {
        return firstNumber / secondNumber;
    }
    [HttpGet]
    [Route("multiply")]
    public double GetMultiply(double firstNumber, double secondNumber)
    {
        return firstNumber * secondNumber;
    }

}