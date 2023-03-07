<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Netflix movie</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./styles.css" />
</head>
<body>
<div class="header">
    <nav class="d-flex justify-content-between align-items-center pt-3 pb-3">
        <img src="./assets/images/logo.png" class="logo" />
        <div>
            <button>Tiếng việt</button>
            <a href="/form-login">Đăng nhập</a>
        </div>
    </nav>
    <div class="header-content">
        <h1 class="title-header-content">Chương trình truyền hình, phim không giới hạn và nhiều nội dung khác.</h1>
        <h3 class="fw-normal mb-3">Xem ở mọi nơi. Hủy bất kỳ lúc nào.</h3>
        <p>Bạn đã sẵn sàng xem chưa? Nhập email để tạo hoặc kích hoạt lại tư cách thành viên của bạn.</p>
        <form class="email-signup" onsubmit="return false;">
            <input type="email" placeholder="Email address" required>
            <button type="submit">Bắt đầu</button>
        </form>
    </div>
</div>
<div class="features">
    <div class="row-feature reveal ">
        <div class="col-6 col-title mb-5">
            <h1>Thưởng thức trên chính TV của bạn.</h1>
            <h3  class="fw-normal mt-3">Xem trên TV thông minh, Playstation, Xbox, Chromecast, Apple TV, đầu phát Blu-ray và nhiều thiết bị khác.</h3>
        </div>
        <div class="col-6 col-img mb-5 d-flex justify-content-center">
            <img src="./assets/images/feature-1.png" alt="">
        </div>
    </div>
    <div class="row-feature reveal">
        <div class="col-6 col-img mb-5 d-flex justify-content-center">
            <img class="me-5" src="./assets/images/feature-2.png" alt="">
        </div>
        <div class="col-6 col-title mb-5">
            <h1>Tải xuống nội dung để xem ngoại tuyến.</h1>
            <h3  class="fw-normal mt-3">Lưu lại những nội dung yêu thích một cách dễ dàng và luôn có thứ để xem.</h3>
        </div>
    </div>
    <div class="row-feature reveal">
        <div class="col-6 col-title mb-5">
            <h1>Xem ở mọi nơi.</h1>
            <h3  class="fw-normal mt-3">Phát trực tuyến không giới hạn phim và chương trình truyền hình trên điện thoại, máy tính bảng, máy tính xách tay và TV.</h3>
        </div>
        <div class="col-6 col-img mb-5 d-flex justify-content-center">
            <img src="./assets/images/feature-3.png" alt="">
        </div>
    </div>
    <div class="row-feature reveal">
        <div class="col-6 col-img mb-5 d-flex justify-content-center">
            <img src="./assets/images/feature-4.png" alt="">
        </div>
        <div class="col-6 col-title mb-5">
            <h1>Tạo hồ sơ cho trẻ em.</h1>
            <h3  class="fw-normal mt-3">Đưa các em vào những cuộc phiêu lưu với nhân vật được yêu thích trong một không gian riêng. Tính năng này đi kèm miễn phí với tư cách thành viên của bạn.</h3>
        </div>
    </div>
</div>
<div class="faq reveal">
    <h2>Câu hỏi thường gặp</h2>
    <ul class="accordion">
        <li>
            <input type="radio" name="accordion" id="first">
            <label for="first">Netflix là gì?</label>
            <div class="content">
                <p>Netflix là dịch vụ phát trực tuyến mang đến đa dạng các loại chương trình truyền hình, phim, anime, phim tài liệu đoạt giải thưởng và nhiều nội dung khác trên hàng nghìn thiết bị có kết nối Internet.</p>
                <p>Bạn có thể xem bao nhiêu tùy thích, bất cứ lúc nào bạn muốn mà không gặp phải một quảng cáo nào – tất cả chỉ với một mức giá thấp hàng tháng. Luôn có những nội dung mới để bạn khám phá và những chương trình truyền hình, phim mới được bổ sung mỗi tuần!</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="second">
            <label for="second">Tôi phải trả bao nhiêu tiền để xem Netflix?</label>
            <div class="content">
                <p>Xem Netflix trên điện thoại thông minh, máy tính bảng, TV thông minh, máy tính xách tay hoặc thiết bị phát trực tuyến, chỉ với một khoản phí cố định hàng tháng. Các gói dịch vụ với mức giá từ 70,000 ₫ đến 260,000 ₫ mỗi tháng. Không phụ phí, không hợp đồng.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="third">
            <label for="third">Tôi có thể xem ở đâu?</label>
            <div class="content">
                <p>Xem mọi lúc, mọi nơi. Đăng nhập bằng tài khoản Netflix của bạn để xem ngay trên trang web netflix.com từ máy tính cá nhân, hoặc trên bất kỳ thiết bị nào có kết nối Internet và có cài đặt ứng dụng Netflix, bao gồm TV thông minh, điện thoại thông minh, máy tính bảng, thiết bị phát đa phương tiện trực tuyến và máy chơi game.</p>
                <p>Bạn cũng có thể tải xuống các chương trình yêu thích bằng ứng dụng trên iOS, Android hoặc Windows 10. Vào phần nội dung đã tải xuống để xem trong khi di chuyển và khi không có kết nối Internet. Mang Netflix theo bạn đến mọi nơi.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="four">
            <label for="four">Làm thế nào để hủy?</label>
            <div class="content">
                <p>Netflix rất linh hoạt. Không có hợp đồng phiền toái, không ràng buộc. Bạn có thể dễ dàng hủy tài khoản trực tuyến chỉ trong hai cú nhấp chuột. Không mất phí hủy – bạn có thể bắt đầu hoặc ngừng tài khoản bất cứ lúc nào.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="five">
            <label for="five">Tôi có thể xem gì trên Netflix?</label>
            <div class="content">
                <p>Netflix có một thư viện phong phú gồm các phim truyện, phim tài liệu, chương trình truyền hình, anime, tác phẩm giành giải thưởng của Netflix và nhiều nội dung khác. Xem không giới hạn bất cứ lúc nào bạn muốn.</p>
            </div>
        </li>
        <li>
            <input type="radio" name="accordion" id="six">
            <label for="six">Netflix có phù hợp cho trẻ em không?</label>
            <div class="content">
                <p>Trải nghiệm Netflix Trẻ em có sẵn trong gói dịch vụ của bạn, trao cho phụ huynh quyền kiểm soát trong khi các em có thể thưởng thức các bộ phim và chương trình phù hợp cho gia đình tại không gian riêng.</p>
                <p>Hồ sơ Trẻ em đi kèm tính năng kiểm soát của cha mẹ (được bảo vệ bằng mã PIN), cho phép bạn giới hạn độ tuổi cho nội dung con mình được phép xem, cũng như chặn những phim hoặc chương trình mà bạn không muốn các em nhìn thấy.</p>
            </div>
        </li>
    </ul>
    <small>Bạn đã sẵn sàng xem chưa? Nhập email để tạo hoặc kích hoạt lại tư cách thành viên của bạn.</small>
    <form class="email-signup" onsubmit="return false;">
        <input type="email" placeholder="Email address" required>
        <button type="submit">Bắt đầu</button>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
    window.addEventListener("scroll", reveal);
    function reveal() {
        var reveal = document.querySelectorAll(".reveal");
        for (let i = 0; i < reveal.length; i++) {
            var windowHeight = window.innerHeight;
            var revealTop = reveal[i].getBoundingClientRect().top;
            var revealPoint = 150;
            if (revealTop < windowHeight - revealPoint) {
                reveal[i].classList.add("active");
            }
            else {
                reveal[i].classList.remove("active");
            }
        }
    }
</script>
</body>
</html>
