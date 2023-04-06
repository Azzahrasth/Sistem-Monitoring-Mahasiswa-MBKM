<?php

include("config.php");
session_start();

if (!isset($_SESSION["login"])) {
    header("location: signin.php");
    exit;
}
if (!isset($_SESSION["mahasiswa"])) {
    header("location: signout.php");
}

$id = $_SESSION["id"];

$mahasiswa = mysqli_query($conn, "SELECT nim, nama_mhs, semester FROM mhs WHERE id_mhs = '$id'");

// Upload File
if(isset($_POST['submit']))
{
    $id_program = $_POST['id_program'];
    $tahun = $_POST['tahun'];
    $namaFile = $_FILES['formFile']['name'];
    $ukuranFile = $_FILES['formFile']['size'];
    $error = $_FILES['formFile']['error'];
    $tmpName = $_FILES['formFile']['tmp_name'];

    // Cek file upload
    if($error === 4)
    {
        echo "<script>
                alert('Upload File Terlebih Dahulu!');
            </script>";
        return false;
    }

    $ekstensiFileValid = ['pdf'];
    $ekstensiFile = explode('.', $namaFile);
    $ekstensiFile = strtolower(end($ekstensiFile));
    if( !in_array($ekstensiFile, $ekstensiFileValid))
    {
        echo "<script>
                alert('File Bukan PDF!');
            </script>";
        return false;
    }

    if($ukuranFile > 5000000)
    {
        echo "<script>
                alert('Ukuran File Terlalu Besar!');
            </script>";
        return false;
    }

    move_uploaded_file($tmpName, 'buktilolos/' . $namaFile);

    mysqli_query($conn, "UPDATE mengikuti SET status_lolos = 'Belum Dikonfirmasi', tahun = '$tahun', file_lolos = '$namaFile' WHERE id_program = '$id_program' AND id_mhs = '$id'");

    if(mysqli_affected_rows($conn) > 0)
    {
        echo "<script>
                alert('File Berhasil Diupload!');
                window.location = 'ttd.php';
            </script>";
    }
    else
    {
        echo "<script>
                alert('File Gagal Diupload!');
                window.location = 'ttd.php';
            </script>";
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/style2.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="index.html" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>SI_MBKM</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/dummy.jpg" alt="" style="width: 40px; height: 40px;">
                        <div
                            class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                        </div>
                    </div>
                    <?php
                    $row = mysqli_fetch_assoc($mahasiswa);

                    ?>

                    <div class="ms-3">
                        <h6 class="mb-0"><?= $row['nama_mhs'] ?></h6>
                        <span>Mahasiswa</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="db_mhs.php" class="nav-item nav-link"><i
                            class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"><i
                                class="far fa-file-alt me-2"></i>Lapor MBKM</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="ttd.php" class="dropdown-item">Tanda Tangan</a>
                            <a href="bl_mhs.php" class="dropdown-item">Bukti Lolos</a>
                        </div>
                    </div>
                    <a href="kmk_mhs.php" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>KMK</a>
                    <a href="lmk_mhs.php" class="nav-item nav-link"><i class="fa fa-table me-2"></i>LMK</a>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0" style="height: 55px;">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="signout.php" style="color: #000000; font-weight: 600; letter-spacing: 0.5px;">SIGN OUT</a>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->

              <!-- Form Start -->
                <div class="container-fluid pt-4 px-4 ayam">
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light rounded h-100 p-4">
                            <form action="" method="post" enctype="multipart/form-data">
                                <h6 class="mb-2">Nama Program</h6>
                                <select class="form-select mb-3" aria-label="Default select example" name="id_program">
                                    <option selected>Pilih Program MBKM</option>
                                    <?php
                                    $result = mysqli_query($conn, "SELECT * FROM program");
                                    while($row = mysqli_fetch_assoc($result))
                                        {
                                    ?>
                                    <option value="<?=$row['id_program']?>"><?=$row['nama_program']?></option>
                                    <?php
                                        }
                                    ?>
                                </select><br>
                                <h6 class="mb-2">Bukti Kelulusan</h6>
                                <div class="mb-2">
                                    <input class="form-control" type="file" id="formFile" name="formFile">
                                </div><br>
                                <h6 class="mb-2">Tahun</h6>
                                    <div class="mb-2">
                                        <input type="number" class="form-control" id="exampleInputEmail1"
                                            aria-describedby="emailHelp" name="tahun">
                                    </div>
                                <button type="submit" class="btn btn-primary" name="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                    
            </div>

        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>