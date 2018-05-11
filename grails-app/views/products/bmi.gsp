<%--
  Created by IntelliJ IDEA.
  User: Sanju
  Date: 5/2/2018
  Time: 11:07 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>
<body>

<br><br><br><br><br><br>
%{--<g:form name="myForm" controller="products" action="calculateBmi">
    <input type="text" name="height" placeholder="height in centimeters"/>
    <input type="text" name="weight" placeholder="weight in kilograms"/>
    <g:submitButton name="submit" value="calculate"/>
</g:form>--}%
%{--<input type="text" name="height" id="height" placeholder="height in centimeters"/>
<input type="text" name="weight" id="weight" placeholder="weight in kilograms"/>--}%
    <div class="container"  id ="commentForm">
    <div class="row">
        <div class="col-lg-6">
            <div class="jumbotron">
        <h1 class="h3 mb-3 font-weight-normal">BMI calculator</h1>
        <label for="height" class="sr-only">Height</label>
        <input type="number" id="height" class="form-control" placeholder="Height in centimeters" required autofocus>
        <label for="weight" class="sr-only">Weight</label>
        <input type="number"  id="weight" class="form-control" placeholder="weight in kilograms" required>

        <button onclick="bmiCalculation();" class="btn btn-lg btn-primary btn-block" type="submit">Calculate BMI</button>
        </div>
        </div>
        <div class="col-lg-6">

        </div>
    </div>



</div>
%{--<button onclick="bmiCalculation();">Calculate BMI</button>--}%
<script>

    function bmiCalculation() {
        var height = document.getElementById('height').value.trim();
        var weight = document.getElementById('weight').value.trim();
        var bmi = (parseFloat(weight)/(parseFloat(height)*parseFloat(height))*10000);
        $('#showBMI').text('Your BMI is '+bmi);
        if(bmi<18.5){
            $('#info').text("You are underweight. A lean BMI can indicate that your weight maybe too low." +
                " You should consult your physician to determine if you should gain weight, as low body mass can decrease your body's " +
                "immune system, which could lead to ilness such as disappearance of periods (women), bone loss, malnutrition and other" +
                " conditions. The lower your BMI the greater these risks become.");
            $('#treatment').text("Drink 6-8 glasses of distilled water a day.\n" +
                "Eat frequent but small meals.\n" +
                "Eat lots of raw fruits and vegetables (green leafy vegetables are great)\n" +
                "Do not drink coffee, alcohol, soda pop,...\n" +
                "Do not eat processed foods; white sugar, white flower,...\n" +
                "Avoid red meat and animal fats.\n" +
                "Reduce intake of dairy products.\n" +
                "Do not smoke and avoid second hand smoke.");
        }
    else if (bmi>18.5&&bmi<24.9)
    {
        $('#info').text("You are Normal Weight. People whose BMI is within 18.5 to 24.9 possess the ideal amount of body weight, associated with living longest, the lowest incidence of serious ilness, as well as being perceived as more physically attractive than people with BMI in higher or lower ranges.");
        $('#treatment').text("");
    }else if(bmi>25&&bmi<29.9)
    {
        $('#info').text("You are overweight. People falling in this BMI range are considered overweight and would benefit from finding healthy ways to lower their weight, such as diet and exercise. Individuals who fall in this range are at increased risk for a variety of ilnesses. If your BMI is 27-29.99 your risk of health problems becomes higher. In a recent study an increased rate of blood pressure, diabetes and heart disease was recorded at 27.3 for women and 27.8 for men. It may be a good idea to check your Waist Circumference and compare it with the recommended limits.");
    }else if(bmi>30&&bmi<34.99)
    {
        $('#info').text("You have Obesity (Class 1). Individuals with a BMI of 30-34.99 are in a physically unhealthy condition, which puts them at risk for serious ilnesses such as heart disease, diabetes, high blood pressure, gall bladder disease, and some cancers. This holds especially true if you have a larger than recommended Waist Size. These people would benefit greatly by modifying their lifestyle. Ideally, see your doctor and consider reducing your weight by 5-10 percent. Such a weight reduction will result in considerable health improvements.");
        $('#treatment').text("");
    }
    else if (bmi>35&&bmi<39.99)
        {
            $('#info').text("You have Obesity (Class 1). Slow and steady weight loss of no more than 1-2 pounds per week is the safest way to lose weight. Too rapid weight loss can cause you to lose muscle rather than fat. It also increases your chances of developing other problems, such as gallstones and nutrient deficiencies. Making long-term changes in your eating and physical activity habits is the only way to lose weight and keep it off!");
            $('#treatment').text("");
        }

        else if(bmi>40)
        {
            $('#info').text("You have Morbid Obesity. With a BMI of 40+ you have an extremely high risk of weight-related disease and premature death. Indeed, you may have already been suffering from a weight-related condition. For the sake of your health it is very important to see your doctor and get specialists help for your condition.");
            $('#treatment').text("");
        }
    }


</script>
<div id="showBMI">

</div>
<div id="info">

</div>
<div id="treatment">

</div>
<div id="bmi">

    <g:if test="${params.bmi != "0"}">
        <p>${params.bmi}</p>
    </g:if>
</div>
</body>
</html>