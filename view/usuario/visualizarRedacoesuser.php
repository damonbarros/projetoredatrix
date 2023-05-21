<?php
    session_start();
    if(empty($_SESSION['token_user'])) {
        header("location: ../../index.php");
    } else {
    include "../../model/conexao.php";
?>

    <?php include "header.php"?>
    <h1 class="h1-user"> Mural de Redações </h1>
        <div class="redacao">
            <span class="listar-redacao"></span>
        </div>
        <span id="msgAlerta"></span>
        <div class="redacao">
            <span class="listar-redacao"></span>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <script src="../../assets/custom1.js"></script>
    </body>
    </html>
<?php
}
?>
