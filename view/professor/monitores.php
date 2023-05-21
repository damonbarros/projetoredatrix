<?php
    session_start();
    include "../../model/conexao.php";
    if(empty($_SESSION['token_adm'])) {
        header("location: ../../index.php");
    } else {
?>

    <title>Monitores Ativos | Redatrix</title>
<?php include "header.php"?>
<body>
    <h1 class="h1-user">Monitores Ativos</h1>
    <form action= "" method="get" class="search">
        <label for="pesquisar"><input class="inputSearch" type="search" name="search" id="pesquisar" placeholder="Pesquisar"></label>
        <button type="submit" class="btnSearch" onclick="searchData()">buscar</button>
    </form>

    <?php
        if(!empty($_GET['search'])){
            $data = $_GET['search'];
            $sql = "SELECT * FROM monitor WHERE email LIKE '%$data%' OR nome_completo LIKE '%$data%' OR senha_monitor LIKE '%$data%' ORDER BY email DESC";

        } else {
            $sql = "SELECT * FROM monitor ORDER BY email DESC";
        }
        $result = $conexao->query($sql);
    ?>

    <table>
        <thead>
            <tr>
                <th>Email</th>
                <th>Nome</th>
                <th>Senha</th>
                <th>Excluir</th>
            </tr>
        </thead>
        <?php
           while($linhas = mysqli_fetch_assoc($result)){
            echo("
                <tr>
                    <td>$linhas[email]</td> 
                    <td>$linhas[nome_completo]</td> 
                    <td>$linhas[senha_monitor]</td> 
                    <td>
                        <a class = 'btn btn-primary' href='excluir.php?email=$linhas[email]'>
                            <svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash3' viewBox='0 0 16 16'>
                                <path d='M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z'/>
                            </svg>
                        </a>
                    </td>
                </tr>");
           }
        ?>
    </table>
    <br>
</body>
</html>
<script>
    var search = document.getElementById('pesquisar');

    search.addEventListener("keydown", function(event){
        if(event.key === "Enter") {
            searchData();
        }
    });
    function searchData(){
        window.location = 'monitores.php?search=' + search.value;
    }
</script>
<?php
    }
?>
