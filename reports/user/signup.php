<?php
require_once '../includes/config.php';
if(isset($_SESSION['userid'])){ header("Location: dashboard.php"); exit(); }

$msg='';
$success = false;

if($_SERVER['REQUEST_METHOD']==='POST'){
    $name   = trim($_POST['name']);
    $email  = trim($_POST['email']);
    $mobile = trim($_POST['mobile']);
    $pass   = trim($_POST['password']);
    $cpass  = trim($_POST['confirm_password']);

    if(empty($name)||empty($email)||empty($mobile)||empty($pass)||empty($cpass)){
        $msg="<div class='alert alert-danger'><i class='fas fa-times-circle'></i> All fields are required!</div>";
    } elseif($pass !== $cpass){
        $msg="<div class='alert alert-danger'><i class='fas fa-times-circle'></i> Passwords do not match!</div>";
    } else {
        $chk_stmt = $con->prepare("SELECT id FROM tbl_user WHERE Email=?");
        $chk_stmt->bind_param("s", $email);
        $chk_stmt->execute();
        $chk_stmt->store_result();

        if($chk_stmt->num_rows > 0){
            $msg="<div class='alert alert-danger'><i class='fas fa-times-circle'></i> Email already registered!</div>";
        } else {
            $hashed_pass = password_hash($pass, PASSWORD_DEFAULT);
            $ins_stmt = $con->prepare("INSERT INTO tbl_user (FullName,Email,MobileNumber,Password,Status) VALUES(?,?,?,?,1)");
            $ins_stmt->bind_param("ssss", $name, $email, $mobile, $hashed_pass);

            if($ins_stmt->execute()){
                $success = true; // ← trigger popup
            } else {
                $msg="<div class='alert alert-danger'><i class='fas fa-times-circle'></i> Registration failed. Please try again.</div>";
            }
        }
        $chk_stmt->close();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Sign Up | Crime Record Management System</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="../css/style.css">
<style>
  /* Popup Overlay */
  .popup-overlay {
    display: none;
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.5);
    z-index: 9999;
    justify-content: center;
    align-items: center;
  }
  .popup-overlay.active {
    display: flex;
  }
  .popup-box {
    background: #fff;
    border-radius: 12px;
    padding: 40px 36px;
    text-align: center;
    width: 360px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.18);
    animation: popIn 0.3s ease;
  }
  @keyframes popIn {
    from { transform: scale(0.7); opacity: 0; }
    to   { transform: scale(1);   opacity: 1; }
  }
  .popup-icon {
    width: 72px;
    height: 72px;
    background: #e8f5e9;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 18px;
  }
  .popup-icon i {
    font-size: 36px;
    color: #4CAF50;
  }
  .popup-box h2 {
    font-size: 22px;
    color: #222;
    margin-bottom: 8px;
  }
  .popup-box p {
    color: #666;
    font-size: 14px;
    margin-bottom: 24px;
  }
  .popup-timer {
    font-size: 13px;
    color: #999;
    margin-bottom: 16px;
  }
  .popup-timer span {
    font-weight: bold;
    color: #2196F3;
  }
  .popup-btn {
    display: inline-block;
    background: #2196F3;
    color: #fff;
    padding: 10px 32px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 15px;
    font-weight: 600;
    border: none;
    cursor: pointer;
    transition: background 0.2s;
  }
  .popup-btn:hover {
    background: #1769aa;
    color: #fff;
  }
</style>
</head>
<body>
<div class="auth-page" style="background:#f0f2f5;">
  <a href="../index.php" style="position:absolute;top:15px;left:15px;color:#2196F3;font-size:22px;"><i class="fas fa-home"></i></a>

  <!-- SUCCESS POPUP -->
  <div class="popup-overlay <?php echo $success ? 'active' : ''; ?>" id="successPopup">
    <div class="popup-box">
      <div class="popup-icon">
        <i class="fas fa-check"></i>
      </div>
      <h2>Registration Successful!</h2>
      <p>Your account has been created.<br>Redirecting you to Sign In...</p>
      <div class="popup-timer">Redirecting in <span id="countdown">4</span> seconds</div>
      <a href="signin.php" class="popup-btn"><i class="fas fa-sign-in-alt"></i> Sign In Now</a>
    </div>
  </div>

  <div class="auth-card" style="width:680px;height:900px;max-width:60%;">
    <div class="auth-title-bar" style="background:#2196F3;">
      <span></span>
      <button class="tab-btn">&#9650; SIGN UP</button>
    </div>
    <div class="auth-body">
      <div class="auth-site-name">Crime Record Management System</div>
      <div style="border-bottom:3px solid #2196F3;margin-bottom:20px;"></div>
      <?php echo $msg; ?>
      <form method="POST" id="signupForm">
        <div style="margin-bottom:12px;">
          <label class="auth-label">Full Name</label>
          <input type="text" name="name" class="auth-input" placeholder="Full Name" required
            value="<?php echo isset($_POST['name'])?htmlspecialchars($_POST['name']):''; ?>">
        </div>
        <div style="margin-bottom:12px;">
          <label class="auth-label">E-mail Address</label>
          <input type="email" name="email" class="auth-input" placeholder="Email" required
            value="<?php echo isset($_POST['email'])?htmlspecialchars($_POST['email']):''; ?>">
        </div>
        <div style="margin-bottom:12px;">
          <label class="auth-label">Mobile Number</label>
          <input type="text" name="mobile" class="auth-input" placeholder="Mobile" required maxlength="15"
            value="<?php echo isset($_POST['mobile'])?htmlspecialchars($_POST['mobile']):''; ?>">
        </div>
        <div style="margin-bottom:16px;">
          <label class="auth-label">Password</label>
          <input type="password" name="password" class="auth-input" placeholder="Password" required>
        </div>
        <div style="margin-bottom:16px;">
          <label class="auth-label">Confirm Password</label>
          <input type="password" name="confirm_password" class="auth-input" placeholder="Confirm Password" required>
        </div>
        <button type="submit" class="btn btn-primary" style="width:100%;justify-content:center;padding:9px;">
          <i class="fas fa-user-plus"></i> Sign Up
        </button>
      </form>
    </div>
    <div class="auth-divider">OR</div>
    <div class="auth-footer">
      Already have an account? <a href="signin.php">Sign In!</a>
    </div>
  </div>
</div>

<script>
  // Auto-redirect countdown if popup is active
  <?php if($success): ?>
  let seconds = 4;
  const countdown = document.getElementById('countdown');
  const timer = setInterval(() => {
    seconds--;
    countdown.textContent = seconds;
    if(seconds <= 0){
      clearInterval(timer);
      window.location.href = 'signin.php';
    }
  }, 1000);
  <?php endif; ?>
</script>
</body>
</html>