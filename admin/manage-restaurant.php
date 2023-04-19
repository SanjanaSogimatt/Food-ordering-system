<?php include('partials/menu.php'); ?>
<div class="main-content">
    <div class="wrapper">
        <h1>Manage Restaurant</h1>
        <br><br><br>
        <a href="<?php echo SITEURL; ?>admin/add-restaurant.php" class="btn-primary">Add Restaurant</a>
<br><br>
        <table class="tbl-full">
                    <tr>
                        <th>S.N.</th>
                        <th>Name of restaurant</th>
                        <th>Image</th>
                        <th>Address</th>
                        <th>Contact</th>
                        <th>Actions</th>
                    </tr>
<?php 

//Query to Get all CAtegories from Database
$sql = "SELECT * FROM tbl_restaurant";

//Execute Query
$res = mysqli_query($conn, $sql);

//Count Rows
$count = mysqli_num_rows($res);

//Create Serial Number Variable and assign value as 1
$sn=1;

//Check whether we have data in database or not
if($count>0)
{
    //We have data in database
    //get the data and display
    while($row=mysqli_fetch_assoc($res))
    {
        $id = $row['id'];
        $name = $row['name'];
        $image = $row['image'];
        $address = $row['Address'];
        $Contact = $row['contact'];

        ?>

            <tr>
                <td><?php echo $sn++; ?>. </td>
                <td><?php echo $name; ?></td>

                <td>

                    <?php  
                        //Chcek whether image name is available or not
                        if($image!="")
                        {
                            //Display the Image
                            ?>
                            
                            <img src="<?php echo SITEURL; ?>images/restaurant/<?php echo $image;?>" width="100px" >
                            
                            <?php
                        }
                        else
                        {
                            //DIsplay the MEssage
                            echo "<div class='error'>Image not Added.</div>";
                        }
                    
                
                    ?>
</td>

<td><?php echo $address; ?></td>
<td><?php echo $Contact; ?></td>
<td>
    <a href="<?php echo SITEURL; ?>admin/delete-restaurant.php?id=<?php echo $id;?>&image=<?php echo $image; ?>" class="btn-danger">Delete Restaurant</a>
</td>
</tr>

<?php

}
}
else
{
//WE do not have data
//We'll display the message inside table
?>

<tr>
<td colspan="6"><div class="error">No restaurant Added.</div></td>
</tr>

<?php
}

?>




</table>
</div>

</div>






<?php include('partials/footer.php'); ?>