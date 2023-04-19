<?php include('partials/menu.php'); ?>

<div class="main-content">
    <div class="wrapper">
        <h1>Add Restaurant</h1>


        <form action="" method="POST" enctype="multipart/form-data">

<table class="tbl-30">
    <tr>
        <td>Name: </td>
        <td>
            <input type="text" name="name" placeholder="Restaurant name">
        </td>
    </tr>

    <tr>
        <td>Select Image: </td>
        <td>
            <input type="file" name="image">
        </td>
    </tr>

    <tr>
        <td>Address: </td>
        <td>
            <input type="text" name="address">            
        </td>
    </tr>

    <tr>
        <td>Contact: </td>
        <td>
            <input type="tel" name="contact">
        </td>
    </tr>

    <tr>
        <td colspan="2">
            <input type="submit" name="submit" value="Add Restaurant" class="btn-secondary">
        </td>
    </tr>

</table>

</form>

<?php 
        
            //CHeck whether the Submit Button is Clicked or Not
            if(isset($_POST['submit']))
            {
                //echo "Clicked";

                //1. Get the Value from CAtegory Form
                $name = $_POST['name'];
                $address=$_POST['address'];
                $contact=$_POST['contact'];
                //For Radio input, we need to check whether the button is selected or not
                

                //Check whether the image is selected or not and set the value for image name accoridingly
                //print_r($_FILES['image']);

                //die();//Break the Code Here

                if(isset($_FILES['image']['name']))
                {
                    //Upload the Image
                    //To upload image we need image name, source path and destination path
                    $image = $_FILES['image']['name'];
                    
                    // Upload the Image only if image is selected
                    if($image != "")
                    {

                        //Auto Rename our Image
                        //Get the Extension of our image (jpg, png, gif, etc) e.g. "specialfood1.jpg"
                        $ext = end(explode('.', $image));

                        //Rename the Image
                        $image = "Food_Category_".rand(000, 999).'.'.$ext; // e.g. Food_Category_834.jpg
                        

                        $source_path = $_FILES['image']['tmp_name'];

                        $destination_path = "../images/restaurant/".$image;

                        //Finally Upload the Image
                        $upload = move_uploaded_file($source_path, $destination_path);

                        //Check whether the image is uploaded or not
                        //And if the image is not uploaded then we will stop the process and redirect with error message
                        if($upload==false)
                        {
                            //SEt message
                            $_SESSION['upload'] = "<div class='error'>Failed to Upload Image. </div>";
                            //Redirect to Add CAtegory Page
                            header('location:'.SITEURL.'admin/add-restaurant.php');
                            //STop the Process
                            die();
                        }

                    }
                }
                else
                {
                    //Don't Upload Image and set the image_name value as blank
                    $image="";
                }

                //2. Create SQL Query to Insert CAtegory into Database
                $sql = "INSERT INTO tbl_restaurant SET 
                    name='$name',
                    image='$image',
                    Address='$address',
                    contact='$contact'
                ";

                //3. Execute the Query and Save in Database
                $res = mysqli_query($conn, $sql);

                //4. Check whether the query executed or not and data added or not
                if($res==true)
                {
                    //Query Executed and Category Added
                    $_SESSION['add'] = "<div class='success'>Restaurant Added Successfully.</div>";
                    //Redirect to Manage Category Page
                    header('location:'.SITEURL.'admin/manage-restaurant.php');
                }
                else
                {
                    //Failed to Add CAtegory
                    $_SESSION['add'] = "<div class='error'>Failed to Add Restaurant.</div>";
                    //Redirect to Manage Category Page
                    header('location:'.SITEURL.'admin/add-restaurant.php');
                }
            }
        
        ?>

    </div>
</div>



<?php include('partials/footer.php'); ?>