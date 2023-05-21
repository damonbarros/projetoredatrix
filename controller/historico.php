<?php
include "../model/conexao.php";
if(isset($_POST['Adicionar'])){
    $nome = $_POST['nome_monitor'];
    $bio = $_POST['historico'];
    
    $target_dirIMG = "../img/";
    $target_file = $target_dirIMG . basename($_FILES["file"]['name']);
    $uploadOkIMG = 1;
    $FileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

    if ($_FILES["file"]["size"] > 10000000) {
        echo "<script>window.alert('Desculpe, seu arquivo está muito grande');</script> <script>location.href='javascript:history.back(1)</script>";
        $uploadOkIMG = 0;
    }


    if($FileType != "jpg") {
        echo "<script>window.alert('Desculpe, somente arquivos em formato jpg são aceitos');</script> <script>location.href='javascript:history.back(1)</script>"; 
        $uploadOkIMG = 0;
    }

    if ($uploadOkIMG == 0) {
        echo "<script>window.alert('Desculpe, seu arquivo não foi carregado.');</script> <script>location.href='javascript:history.back(1)</script>";
    // if everything is ok, try to upload file
   } else {
        if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
            $foto = htmlspecialchars(basename($_FILES["file"]['name']));
            $compare = "SELECT * FROM biografia WHERE nome_monitor = '$nome' ";
            $result = $conexao->query($compare);
            if($result->num_rows == 0) {
                $sql = "INSERT INTO biografia VALUES(null,'$nome','$bio','$foto')";
                $conexao->query($sql);
                echo mysqli_error($conexao);
                echo "<script>window.alert('Histórico de monitor adicionado com sucesso');</script> <script>location.href='javascript:history.back(1)'</script>";
            } else {
                echo "<script>window.alert('O histórico do monitor já existe');</script> <script>location.href='javascript:history.back(1)'</script>";
            }

        } else {
            echo "<script>window.alert('Desculpe houve um erro no upload do arquivo');</script> <script>location.href='javascript:history.back(1)'</script>";
        }
  }
} 
?>