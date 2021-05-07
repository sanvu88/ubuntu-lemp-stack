<p align="center"><strong>Auto Install & Optimize LEMP Stack on Ubuntu (18.04, 20.04)</strong></p>
<p align="center"><strong>Author: Sanvv - HOSTVN.NET Technical</strong></p>
<p align="center"><strong>Home Page: <a href="https://hostvn.vn/">Hostvn Scripts Home page</a> , <a href="https://hostvn.net">Hostvn.net - Tên miền, Web Hosting, Email, VPS &amp; Dịch vụ lưu trữ Website</a></strong></p>
<p align="center"><strong>Document: https://help.hostvn.vn/</strong></p>
<p align="center"><strong>Groups Support: https://www.facebook.com/groups/hostvn.vn</strong></p>

<p align="center"> <img src="https://blog.hostvn.net/wp-content/uploads/2020/07/logo-big-2.png" /> </p>

########################################################################################

Script được viết bằng shell dùng để cài đặt LEMP Stack (Nginx - MariaDB - PHP-FPM) trên Ubuntu (18.04, 20.04), Debian 10.

<b>Vui lòng không sao chép, phát hành lại với mục đích thương mại, donate. Xin cảm ơn.</b>

## 1. Chi tiết Script:

### 1.1. Cài đặt

- Cập nhật liên tục, cung cấp Menu giúp dễ dàng thao tác, tự động cài đặt.
- Cài đặt các phần mềm với phiên bản mới nhất từ chính trang chủ.
- Mariadb: 10.5.
- Phiên bản Nginx Stable.
- Cho phép lựa chọn phiên bản PHP: 5.6, 7.0, 7.1, 7.2, 7.3, 7.4, 8.0
- phpMyAdmin 4.9.x nếu cài đặt PHP mặc định là 5.6, phpMyAdmin 5.0.x nếu cài đặt PHP mặc định là 7.x.
- Cấu hình Nginx FastCGI cache
- Cấu hình Nginx Pagespeed
- Cài đặt PHPMemcachedAdmin, phpRedisAdmin, Opcache Dashboard.
- Cài đặt memcached, redis cache. (Mặc định sẽ không bật).
- Cài đặt Fail2ban.
- Tích hợp Let's Encrypt SSL.
- Tích hợp CloudFlare DNS API giúp xác thực SSL nhanh hơn.
- Cung cấp Menu nâng cấp Nginx, MariaDB, PHP, Redis, Memcached, phpMyAdmin.
- Cài đặt WP-CLI, Composer, supervisor, Rclone.
- Cài đặt: ClamAV, ImunifyAV.
- KHÔNG THU THẬP BẤT KỲ THÔNG TIN GÌ TRÊN VPS CỦA BẠN.

### 1.2. Tối ưu

- Cấu hình tối ưu MySQL, Nginx, PHP, Opcache, Memcached, Redis phù hợp theo thông số của VPS.
- Cấu hình Brotli Compress.
- Cấu hình rewrite URL với một số mã nguồn phổ biến: WordPress, Laravel, Opencart, Magento, Drupal ...
- Cho phép chạy song song hai phiên bản PHP.
- Quản lý FTP dễ dàng trong trường hợp bạn thuê coder và chỉ muốn họ được phép access vào thư mục nhất định.
- Cho phép lựa chọn Redis Cache hoặc Memcached giúp tăng tốc độ website.
- Cho phép cấu hình tự động gia hạn Let's Encrypt.
- Menu hỗ trợ cấu hình SSL trả phí.
- Menu xem error log Nginx, Mysql, PHP và xem theo từng tên miền cụ thể.
- Cronjob tự động cập nhật dải IP mới nhất của Cloudflare cho Nginx và CSF Firewall.
- And More ...

### 1.3. Bảo mật

- Cấu hình tăng cường bảo mật từ tầng webserver.
- Cấu hình website chạy với user khác nhau hạn chế lây lan mã độc giữa các website.
- Disable các hàm nguy hiểm, bật open_basedir và một số config khác nhằm tăng cường bảo mật.
- Auto block bruteforce SSH, SFTP, Admin Tool .... với Fail2ban.
- Block run shell trong thư mục uploads WordPress. Chặn truy cập các thư mục, file nhạy cảm trên WordPress.
- Chống Bruteforce wp-admin.
- BLock, Unblock IP dễ dàng với menu quản lý Firewall.
- Disable User API - /wp-json/wp/v2/users - trên WordPress tránh lộ thông tin User.
- Thay đổi Port SSH tránh scan SSH.
- Cho phép thay đổi port Admin.
- Cho phép thay đổi port SSH/SFTP.
- Tự động tạo mật khẩu mạnh.
- Scan Malware với Clamav, ImunifyAV.
- And More ...

### 1.4. Quản lý WordPress

- Kiểm tra phiên bản WordPress đang sử dụng.
- Cập nhật WordPress.
- Cập nhật plugins.
- Tối ưu Database.
- Repair Database.
- Sao lưu dữ liệu (Local/GG Drive).
- Khôi phục dữ liệu (Local/GG Drive).
- Thay đổi tên miền.
- Đổi mật khẩu admin (wp-admin).
- Cài đặt WordPress tự động.
- Bật/tắt Yoast Seo config.
- Bật/Tắt Rank Math Seo config.
- Cấu hình Nginx với một số plugins cache phổ biến: WP-Rocket, w3 total cache, wp supercache, Cache Enabler, Swift Performance, Fast cache.
- Thêm cache key tránh trùng lặp nội dung giữa các site khi dùng memcached hoặc redis.
- Bật/tắt Debug.
- Bật/tắt chế độ bảo trì.
- Bật/Tắt disable xmlrpc (Mặc định sẽ disable xmlrpc để tránh bị khai thác DDOS).
- Huỷ kích hoạt toàn bộ plugins.
- Random database prefix khi sử dụng chức năng cài đặt tự động.
- And more ...

### 1.5. Sao lưu/Khôi phục dữ liệu
- Backup và restore dữ liệu từ Google Drive với Rclone.
- Backup, restore tại Local.
- Thiết lập số bản backup lưu trữ.
- Quản lý các bản sao lưu.
- Cho phép kết nối nhiều tài khoản Google Drive.

## 2. Yêu cầu

- VPS tối thiểu 512MB ram và chưa cài đặt bất kỳ dịch vụ nào.
- Ubuntu 18.04, 20.04, Debian 10.

## 3. Cách cài đặt

`curl -sO https://scripts.hostvn.net/install && chmod +x install && ./install`

## 4. Các tính năng sẽ phát triển

- Các tính năng theo request của người dùng

## 5. Cách sử dụng

- Vui lòng truy cập: https://help.hostvn.vn/

## 6. Nguồn download các phần mềm

- Nginx: http://nginx.org/en/download.html
- MariaDB: https://downloads.mariadb.org/
- PHP: https://www.php.net/
- phpMyAdmin: https://www.phpmyadmin.net/
- PHPMemcachedAdmin: https://github.com/elijaa/phpmemcachedadmin
- phpRedisAdmin: https://github.com/erikdubbelboer/phpRedisAdmin
- Rclone: https://rclone.org/
- WP-CLI: https://wp-cli.org/
- Composer: https://getcomposer.org/
- ClamAV: https://www.clamav.net/
- ImunifyAV: https://www.imunify360.com/antivirus

## 7. Contact

- Homepage: https://hostvn.vn , https://hostvn.net
- Group: hhttps://www.facebook.com/groups/hostvn.vn
- Email: Sanvv@hostvn.com

## 8. Feedback

- Do chưa có nhiều kinh nghiệm nên Scripts khó tránh khỏi thiếu sót, rất mong nhận được ý kiến đóng góp của các bạn để Scripts ngày càng hoàn thiện hơn.
- Mọi ý kiến đóng góp các bạn vui lòng gửi về sanvv@hostvn.com, Groups Facebook: https://www.facebook.com/groups/hostvn.vn hoặc tạo Github Issues.

## 9. Contributors & Credits
### Developers / Maintainers
- Sanvv

### Contributors

