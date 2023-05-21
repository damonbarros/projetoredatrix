<?php
session_start();
include "../../model/conexao.php";

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link rel="shortcut icon" href="../../assets/logo_ico.ico" type="image/x-icon">
    <title>Sobre</title>
</head>
<body class="body_monitor">
<?php include "header.php"?>
    <h1 style="text-align:center">Informações gerais sobre o site</h1><br>
    <!--<img src="" alt="" >Imagem dos Monitores</img> -->

    
    <p>O site criado pelos alunos Crislanny, Damon, Felipe e Sarah, do 3° D da EEEP Walter Ramos de Araújo,no que tange o trabalho de conclusão do curso técnico de informática, ministrado pelo professor Heden Silva, destaca-se por sua abordagem prática e interativa. Ele apresenta uma variedade de ferramentas que facilitam o processo de elaboração de redações, desde a procura de repertórios sobre o tema até a estruturação e organização do texto.
    Uma das principais características do site é a presença de exemplos de redações bem-sucessidas. Os monitores do projeto Redatrix, ministrado pela professora Tamires Evelin, compartilham redações, proporcionando aos visitantes do site a oportunidade de observar e aprender com trabalhos de qualidade. Além disso, os monitores também contribuem com sua experiência, oferecendo comentários e sugestões construtivas para cada redação apresentada.
    Outro destaque do site é a seção de vídeos. Os monitores postarão uma série de vídeos sobre como usar conectivos, organizar o texto, utilizar citações entre outras temáticas. Essas videoaulas são fundamentais para que os estudantes compreendam as exigências de cada gênero e possam se expressar de maneira eficaz. 

O site do projeto Redatrix representa um recurso valioso para estudantes que desejam aprimorar suas habilidades de redação. Com suas ferramentas interativas, o site oferece um ambiente estimulante e enriquecedor para o desenvolvimento das capacidades de escrita dos estudantes.</p>
    <h1 style="display:flex; align-items:center; justify-content:center;margin-top:3%;"> Histórico de Monitores </h1>
    <hr>
        <?php
            $sql = "SELECT * FROM biografia ";
            $resultado = $conexao->query($sql);

            if ($resultado->num_rows > 0) {
                while($row = $resultado->fetch_assoc()) {
                $id = $row["id_bio"];
                $nome = $row["nome_monitor"];
                $historico = $row["bio"];
                $foto = $row['foto'];
                echo "<div>";
                echo "<img  src='../../img/$foto' width= '159px' height='150px'>";
                echo "<p><strong>Nome do Monitor: </strong> " . $nome . "</p>";
                echo "<p class='p-monitor'><strong>Histórico: </strong> " ."<div class='p-redacao'>$historico</div>" . "</p>";
            echo "</div>";
            echo "</br>";
                echo "<hr>";
                }
            } else {
            echo "Nenhum Resultado";
            }
        ?>
</body>
    
</body>
</html>