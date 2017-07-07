<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<div style="margin-top:10px; color: black">
    <div>
        <p style="line-height: 1.7; color: black;">
            Cám ơn Bạn đã mua hàng tại <strong>Kaylee.vn</strong><Br>
            Chúng tôi sẽ liên hệ với bạn để hoàn tất và chuyển hàng trong thời gian sớm nhất.<br>
            Mã đơn hàng: <strong>{order_code}</strong>
        </p>
        <div>
            <div >

                <div style="margin-top:20px; padding-bottom: 10px">
                    <b style="font-size: 13px; color: black;">Thông tin người đặt hàng</b>
                </div>

                <table>
                    <tr><td>Họ tên:</td><td>{fullname}</td></tr>
                    <tr><td>Điện thoại:</td><td>{phone}</td></tr>
                    <tr><td>Email:</td><td>{email}</td></tr>
                    <tr><td>Địa chỉ:</td><td>{address}</td></tr>
                    <tr><td>Ghi chú:</td><td>{note}</td></tr>
                </table>


            </div>

            <div>
                <div style="margin-top:20px; padding-bottom: 10px">
                    <b style="font-size: 13px; color: black;">Thông tin thanh toán</b>
                </div>

                <div class="paymentinfo" style="margin-top: 5px; line-height: 1.7; color: black;">
                    <table width="100%" border="1">
                        <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền (VND)</th>
                        </tr>
                        </thead>
                        <tbody>
                            {content}
                        </tbody>
                    </table>

                    <table>
                        <tr><td>Tổng tiền(VND):</td><td>{amount}</td></tr>
                        <tr><td>Phí vận chuyển(VND):</td><td>{fee}</td></tr>
                        <tr><td>Tổng cộng(VND):</td><td>{amountTotal}</td></tr>
                    </table>
                </div>

            </div>
        </div>


    </div>
</div>
</div>
<br><br>
<p style="line-height: 1.7; color: black;">
    Để được hỗ trợ, vui lòng liên hệ theo Hotline : (08) 1234 5678.
</p>