$(document).ready(function () {
    $('#commentForm').validate({
        rules:{
            // image:"required",
            name:"required",
            price:{
                required:true,
                maxlength: 8
            },
            description:"required",
            exercise_name:"required",
            author:"required",
            blog_name:"required",
            member_name:"required",
            height:
                {
                    required:true,
                    maxlength: 4
                },

            weight:
                {
                    required:true,
                    maxlength:4
                },

            address:"required",
            contact:{
                required: "true",
                maxlength:10
            },
            email:{
                required:true,
                email:true
            },
            package_type: "required",
            event_name:"required",
            organized_by:"required"
        },
        messages:{
            // image:"Please insert image",
            name:"Please enter name",
            price:{
                required:"Please enter the price",
                maxlength: "Max limit reached"
            },
            description:"Please enter the description",
            exercise_name:"Please enter the exercise  name",
            author:"Please enter author's name",
            blog_name:"Please enter blog name",
            member_name:"Please enter member's name",
            height:{
                required:"Please enter height",
                maxlength:"Max height reached"
            },
            weight:{
                required:"Please enter weight",
                maxlength:"Max weight reached"
            },
            address:"Please enter address",
            contact:{
                required:"Please enter contact",
                maxlength:"Max limit reached"
            },
            email:"Please enter email",
            package_type: "Plese specify the package type",
            event_name:"Please enter event name",
            organized_by:"Please enter organizer's name"

        }
    })
});