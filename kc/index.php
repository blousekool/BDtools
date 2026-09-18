<?php
$ipGarderen = "83.247.51.250";
$ipHarderwijk = "31.3.9.78";
$ipTest = "145.53.250.180";

$error = null;
$nofilesyet = true;
if ($_SERVER['REMOTE_ADDR'] === $ipGarderen) {
    $isHarderwijk = false;
    $isGarderen = true;
}else{
    $isHarderwijk = true;
    $isGarderen = false;
}
$f = filter_input(INPUT_GET, 'f', FILTER_SANITIZE_EMAIL);
if (empty($f)) {
    $error = "Geen hash meegestuurd!";
}else{
    $files = preg_grep("~^{$f}.*\.jpg$~", scandir("./fotos/"));
    if(!empty($files)){
        $nofilesyet = false;
        $files = array_values($files);
    }

}
?>
<style>
    * {
        margin: 0;
    }

    body {
        background-color: #fff;
    }

    .images {
        margin-top: 40px;
        display: flex;
        justify-content: space-evenly;
        border-radius: 5px;
        flex-wrap: wrap;
        align-content: space-between;
        border: 1px solid white;
        padding: 5px;
    }

    .image {
        width: 25%;
        margin: 10px;
        padding: 0;
        box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.15);
        border-radius: 5px
    }

    @media only screen  and (max-width: 768px) {
        .image {
            width: 33%;
        }
    }

    @media only screen  and (max-width: 600px) {
        .image {
            width: 50%;
        }
    }

    @media only screen  and (max-width: 500px) {
        .image {
            width: 100%;
        }
    }

    .download-button {

        margin-top: 40px;
        margin-bottom: 10px;
        background-color: rgba(145, 192, 60, 1);
        height: 55px;
        width: 300px;
        display: initial;
        font-size: 25px;
        padding: 0;
        color: white;
        border-radius: 5px;
        border: 1px solid rgb(129, 173, 48);
        font-weight: 500;
    }

    .download-button:hover {
        background-color: rgb(146, 192, 60);
    }

    .download-wrapper {
        display: flex;
        justify-content: center;
        margin-top: 100px;
        border-radius: 5px;
    }

    .download-form {
        background-color: transparent;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 0;
    }

    .div_logo {
        position: absolute;
        right: 40px;
        top: 0;
        padding: 20px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }

</style>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="robots" content="noindex">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title><?= $isGarderen ? 'Klimbos Garderen' : 'Klimbos Harderwijk'?></title>
    <!-- bootstrap 5 css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
</head>

<div class="download-wrapper mx-2">
    <div id='download'>
        <?php if(!empty($error)){
            ?>
            <div class="alert alert-warning mt-2" role="alert">
                <div class='d-flex justify-content-start'>
                    <div class='w-100'>
                        <div class='h4 my-auto'>Er is iets fout gegeaan</div>
                        <div class='my-auto mt-2  fst-italic'><?= $error ?></div>
                    </div>
                </div>
            </div>
            <?php
        }else if(!empty($nofilesyet)){
            ?>
            <div class="alert alert-warning mt-2" role="alert">
                <div class='d-flex justify-content-start'>
                    <div class='w-100'>
                        <div class='my-auto'>
                            <h3>Nog geen fotos gevonden.</h3>
                            Het kan tot een dag duren dat ze online staan. Sla deze pagina op in je favorieten en probeer het straks nog eens. <br>
                            <span class="fst-italic text-danger">Als je deze pagina sluit, is niet meer te achterhalen wat jou persoonlijke code was!</span>
                            <br>
                            <button class="btn btn-secondary" onClick="favorite(this);">Sla op in mijn favorieten</button>
                            <br>
                            <br>
                            <h3>It looks like your photos aren't online yet.</h3
                            This can take up to 24 hours. Bookmark this page to try again later<br>
                            <span class="fst-italic text-danger">If you close this page, there is no way to get your personal code back, so bookmark this page!</span>
                            <br>
                            <button class="btn btn-secondary" onClick="favorite(this);">Add to favorites</button>
                        </div>
                    </div>
                </div>
            </div>
            <?php
        }else{
            ?>
            <div class="alert alert-success mt-2" role="alert">
                <div class='d-flex justify-content-start'>
                    <div class='w-100'>
                        <div class='my-auto  fst-italic'>Klik op een foto om hem in hoge resolutie te downloaden!</div>
                    </div>
                </div>
            </div>
            <?php
        }
        ?>
        <div class="div_logo" style="<?= $isGarderen ? 'background: rgba(146, 192, 60, 1)' : 'background-color: #124b70'?>">
            <?php
            if($isGarderen){
                echo '<img src="https://www.klimbosgarderen.nl/images/klimbos-garderen-logo.png" alt="logo" style="width:90px; image-rendering: crisp-edges;">';
            }else{
                echo '<img src="https://www.klimbosharderwijk.nl/images/klimbos-harderwijk-logo.png" alt="logo" style="width:90px; image-rendering: crisp-edges;">';
            }
            ?>
        </div>
    </div>
</div>
<div class="images">
    <?php if(empty($error)){

        foreach ($files as $file){
            ?>
            <div class="image">
                <a href="fotos/<?=$file?>" download>
                    <img width="100%" src='fotos/<?=$file?>'>
                </a>
            </div>
            <?php
        }
    }
    ?>
</div>
<script>
    function favorite(a) {
        pageTitle=document.title + ' fotos';
        pageURL=document.location;
        try {
            // Internet Explorer solution
            eval("window.external.AddFa-vorite(pageURL, pageTitle)".replace(/-/g,''));
        }
        catch (e) {
            try {
                // Mozilla Firefox solution
                window.sidebar.addPanel(pageTitle, pageURL, "");
            }
            catch (e) {
                // Opera solution
                if (typeof(opera)=="object") {
                    a.rel="sidebar";
                    a.title=pageTitle;
                    a.url=pageURL;
                    return true;
                } else {
                    // The rest browsers (i.e Chrome, Safari)
                    alert('Press ' + (navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D to bookmark this page.');
                }
            }
        }
        return false;
    }
</script>
