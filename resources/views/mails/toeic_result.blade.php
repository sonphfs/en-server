<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
</head>

<body class="text-center">
<div class="">
    <div class="aHl"></div>
    <div id=":mz" tabindex="-1"></div>
    <div id=":mo" class="ii gt">
        <div id=":mn" class="a3s aXjCH ">
            <div style="font-family:helvetica,arial,sans-serif;font-size:15px;color:#000;background:#e7e7e7;padding-top:20px;line-height:20px; padding-bottom: 20px;">
                <div class="adM">
                </div>
                <div style="width:100%;max-width:600px;margin:auto;background:#fff;border-radius:15px">
                    <div class="adM">
                    </div>
                    <table style="background:#00c3f8;width:100%;padding-top:30px;border-radius:10px 10px 0px 0px;padding-left:40px;padding-bottom:30px">
                        <tbody>
                        <tr>
                            <td style="border-right:1px solid #fff;max-width:142px;height:45px">
                                <h2 style="color: #fff">
                                    ENC
                                </h2>
                            </td>
                            <td style="text-decoration:none;border-style:none;color:#ffffff;padding-left:15px;font-family:'Museo Sans Rounded',Museo Sans Rounded,'Museo Sans',Museo Sans,'Helvetica Neue',Helvetica,Arial,sans-serif;border-width:0px">
                                Chúng tôi hướng đến những điều tuyệt vời nhất!
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <table style="margin-right:auto;margin-left:auto;padding:20px 40px">
                        <tbody>
                        <tr>
                            <td>
                                <p><span style="color:#000000"><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-size:14px"><strong>Hi Sonph ,</strong></span></span></span></p>

                                <p><span style="color:#000000;font-family:Arial,Helvetica,sans-serif"><span
                                                style="font-size:14px">Bạn vừa thi thử toeic trên hệ thống ENC. Kết quả thi của bạn như sau:</span></span>
                                </p>

                                <p><span style="color:#000000"><span
                                                style="font-family:Arial,Helvetica,sans-serif"><span
                                                    style="font-size:14px">
                                                    Bài thi: {{ $examinationResult['examination']->title }}
                                            </span></span>
                                            </span>
                                </p>
                                <p><span style="color:#000000"><span
                                                style="font-family:Arial,Helvetica,sans-serif"><span
                                                    style="font-size:14px">
                                                    Mã đề: {{ $examinationResult['examination']->code }}
                                            </span></span>
                                            </span>
                                </p>
                                <p><span style="color:#000000"><span
                                                style="font-family:Arial,Helvetica,sans-serif"><span
                                                    style="font-size:14px">
                                                    Số câu đúng: {{ $examinationResult['total_correct'] }}
                                            </span></span>
                                            </span>
                                </p>
                                <p><span style="color:#000000"><span
                                                style="font-family:Arial,Helvetica,sans-serif"><span
                                                    style="font-size:14px">
                                                    Số câu sai: {{ $examinationResult['total_incorrect'] }}
                                            </span></span>
                                            </span>
                                </p>
                                <p><span style="color:#000000"><span
                                                style="font-family:Arial,Helvetica,sans-serif"><span
                                                    style="font-size:14px">
                                                    Điểm nghe: {{ $examinationResult['listening_score'] }}
                                            </span></span>
                                            </span>
                                </p>
                                <p><span style="color:#000000"><span
                                                style="font-family:Arial,Helvetica,sans-serif"><span
                                                    style="font-size:14px">
                                                    Điểm đọc: {{ $examinationResult['reading_score'] }}
                                            </span></span>
                                            </span>
                                </p>
                                <p><span style="color:#000000"><span
                                                style="font-family:Arial,Helvetica,sans-serif"><span
                                                    style="font-size:14px">
                                                    Tổng điểm: {{ $examinationResult['listening_score'] + $examinationResult['reading_score'] }}
                                            </span></span>
                                            </span>
                                </p>
                            </td>
                        </tr>
                        <tr style="text-align:center">
                            <td>
                            <p><a href="{{env('CLIENT_URL')}}" style="width:150px;height:45px;display:inline-block;background:#7ac60c;text-align:center;line-height:45px;color:#fff;text-decoration:none;border-radius:23px;font-weight:600" target="_blank" data-saferedirecturl="">Làm bài thi khác</a>
                                </p>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <div style="padding:30px 30px 0px"></div>
                </div>
            </div>
        </div>
    </div>
    <div id=":n4" class="ii gt" style="display:none">
        <div id=":n3" class="a3s aXjCH undefined"></div>
    </div>
    <div class="hi"></div>
</div>
</body>

</html>
