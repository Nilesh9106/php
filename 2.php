<?php
$i=7;
$arr = array(1,3,2,4,5,6,9);
try{
        for($i=0;;$i++){
                if($i>6){
                        throw new Exception('array index out of bound');
                }
                echo $arr[$i]." </br>";
        }
}
catch(Exception $e){
        echo $e->getMessage();
}
?>
