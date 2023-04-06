<?php

include("config.php");
session_start();

if (!isset($_SESSION["login"])) {
    header("location: signin.php");
    exit;
}
if (!isset($_SESSION["dosen"])) {
    header("location: signout.php");
}

$id = $_SESSION["id"];

// [ View ]
// create view v_progres as SELECT COUNT(status_mbkm) as progres FROM mhs WHERE status_mbkm = 'Progres';
// create view v_sedang as SELECT COUNT(jumlah_sks) as sedang FROM mhs WHERE status_mbkm = 'Sedang';
// create view v_tercapai as SELECT COUNT(jumlah_sks) as tercapai FROM mhs WHERE status_mbkm = 'Tercapai';

$pm = mysqli_query($conn, "SELECT jumlah_mhs_mbkm FROM mhs JOIN pm ON mhs.id_pm = pm.id_pm JOIN dosen ON pm.id_dosen = dosen.id_dosen WHERE dosen.id_dosen = '$id'");
$progres = mysqli_query($conn, "select * from v_progres;");
$sedang = mysqli_query($conn, "select * from v_sedang;");
$tercapai = mysqli_query($conn, "select * from v_tercapai;");
$dosen = mysqli_query($conn, "SELECT * FROM dosen WHERE id_dosen = '$id'");
$dosen2 = mysqli_query($conn, "SELECT * FROM dosen WHERE id_dosen = '$id'");

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SI_MBKM Dosen</title>
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
                    <div class="ms-3">
                        <?php

                        $row = mysqli_fetch_assoc($dosen);

                        ?>
                        <h6 class="mb-0"><?= $row['nama_dosen'] ?></h6>
                        <span>Dosen</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="db_dosen.php" class="nav-item nav-link active"><i
                            class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <a href="acc_mk_dosen.php" class="nav-item nav-link"><i class="fa fa-table me-2"></i>ACC MK</a>
                    <a href="pm_dosen.php" class="nav-item nav-link"><i class="fa fa-th me-2"></i>PM</a>
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
                        <a href="signout.php" style="color: #000000; font-weight: 600; letter-spacing: 0.5px;">SIGN
                            OUT</a>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->

            <!-- Deskripsi Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-align: right rounded p-4">
                    <div class="d-flex align-items-center justify-content-around mb-4">
                        <h6 class="mb-0">SISTEM INFORMASI MBKM</h6>
                    </div>
                    <h7>
                        Halo, Selamat datang di Sistem Informasi MBKM.
                        Sistem ini merupakan layanan yang memuat informasi-informasi yang terkait dengan
                        program MBKM yang diikuti oleh mahasiswa Ilmu komputer UPI
                    </h7>
                </div>
            </div>
            <!-- Deskripsi End -->

            <!-- Jumlah Mahasiswa Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-around mb-4">
                        <h6 class="mb-0">JUMLAH MAHASISWA</h6>
                    </div>
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-white rounded d-flex align-items-center justify-content-around p-4">
                                    <i class="fas fa-user-alt fa-3x text-primary"></i>
                                    <div class="ms-3">
                                        <?php

                                        $row = mysqli_fetch_assoc($pm);

                                        ?>
                                        <p class="mb-2">DIBIMBING</p>
                                        <div class="i-mhs">
                                            <h6 class="mb-0">
                                                <?php
                                                if (isset($row)) {
                                                    echo $row['jumlah_mhs_mbkm'];
                                                } else {
                                                    echo "0";
                                                }
                                                ?>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-white rounded d-flex align-items-center justify-content-around p-4">
                                    <i class="fa fa-chart-line fa-3x text-primary"></i>
                                    <div class="ms-3">
                                        <?php
                                        $row = mysqli_fetch_assoc($progres);
                                        ?>
                                        <p class="mb-2">PROGRESS</p>
                                        <h6 class="mb-0"><?= $row['progres'] ?></h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-white rounded d-flex align-items-center justify-content-around p-4">
                                    <i class="fas fa-sync fa-3x text-primary"></i>
                                    <div class="ms-3">
                                        <?php
                                        $row = mysqli_fetch_assoc($sedang);
                                        ?>
                                        <p class="mb-2">SEDANG</p>
                                        <h6 class="mb-0"><?= $row['sedang'] ?></h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-white rounded d-flex align-items-center justify-content-around p-4">
                                    <i class="fas fa-check-square fa-3x text-primary"></i>
                                    <div class="ms-3">
                                        <?php
                                        $row = mysqli_fetch_assoc($tercapai);
                                        ?>
                                        <p class="mb-2">TERCAPAI</p>
                                        <h6 class="mb-0"><?= $row['tercapai'] ?></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Jumlah Mahasiswa End -->

            <!-- Identitas Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-around mb-4">
                        <h6 class="mb-0">IDENTITAS PENGGUNA</h6>
                    </div>
                    <div class="identitas-mhs">
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-white rounded d-flex align-items-center justify-content-around p-4">
                                <div class="mb-3">
                                    <?php

                                    $row = mysqli_fetch_assoc($dosen2);

                                    ?>
                                    <p class="mb-2">Dosen</p>
                                    <div class="i-mhs">
                                        <h6 class="mb-0 text-left"><?= $row['nip'] ?></h6>
                                        <h6 class="mb-0 text-left"><?= $row['nama_dosen'] ?></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Identitas End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Sistem Informasi MBKM</a>, All Right Reserved.
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                            </br>
                            Distributed By <a class="border-bottom" href="https://themewagon.com"
                                target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
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