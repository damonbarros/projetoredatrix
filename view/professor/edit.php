<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link rel="stylesheet" href="../../assets/css/login.css">
    <link rel="shortcut icon" href="../../assets/logo_ico.ico" type="image/x-icon">
    <title>Editar Monitores | Redaflix</title>
</head>
<body>
    <header class="header">
                    <div class="logo">
                    <a href="paginaAdm.php"><img src="../../assets/logo_img.png"></a>
                    </div>
                    
                    <nav class="nav">
                        <ul class="navbar">
                            <li>
                                <a href="novoMonitor.php">Inserir monitor</a>
                            </li>
                            <li>
                                <a href="monitores.php">Monitores Ativos</a>
                            </li>
                            <li>
                                <a href="historicodeMonitores.php">Inserir Histórico</a>
                            </li>
                            <li>
                                <a href="visualizarHistorico.php">Histórico de Monitores</a>
                            </li>
                            <li>
                                <a href="redacao.php">Redações</a>
                            </li>
                            <li class="btnExit">
                                <a class="aExit" href="../../controller/exit.php">Deslogar</a>
                            </li>
                        </ul>
                    </nav>
                </header>
        <?php
        session_start();
        include "../../model/conexao.php";
            if(empty($_SESSION['token_adm'])) {
                header("location: ../../index.php");
            } else {

                if(!empty($_GET['id_bio'])){
                    $id = $_GET['id_bio'];
                    $mostre = "SELECT * FROM biografia WHERE id_bio = '$id' ";
                    $result = $conexao->query($mostre);
                    $row = $result->fetch_asssoc();

                    if($result->num_rows > 0){
                        $id1 = $row['id_bio'];
                        $bio = $row['bio'];
                    } 
                }
        ?>
        <main class="main_cadastro">
            <form action="" method="post" class="form_cadastro">
                <h1 class="legend_cad">Atualizar Biografia</h1>
                <label for="email"><input type="text" name="" id="email" value="<?php echo "$id1" ?>" placeholder="ID" required></label>
                <label for="bio">Nova Biografia:</label>
                <textarea name="bio" id="bio" cols="30" rows="10" required><?php $bio ?></textarea>
                <button type="submit" name="update" class="sendBtn">Atualizar</button>
            </form>
            </main>
        <?php
            }
        ?>
</body>
</html>