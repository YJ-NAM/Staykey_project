<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/layout_header.jsp" />



<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>숙소 등록</h2>
    <small>숙소를 추가 할 수 있습니다.</small>
</div>




<div class="pb100">
    <form name="write_form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin/stayWriteOk.do">
    <table class="table-form mt-3">
        <colgroup>
            <col width="16%" />
            <col width="34%" />
            <col width="16%" />
            <col />
        </colgroup>
        <tr>
            <th>숙소 유형</th>
            <td colspan="3">
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="stay_type" value="호텔" class="form-check-input" checked="checked" /> 호텔</label>
                </div>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="stay_type" value="호스텔" class="form-check-input" /> 호스텔</label>
                </div>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="stay_type" value="게스트하우스" class="form-check-input" /> 게스트하우스</label>
                </div>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="stay_type" value="민박" class="form-check-input" /> 민박</label>
                </div>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="stay_type" value="펜션" class="form-check-input" /> 펜션</label>
                </div>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="stay_type" value="리조트" class="form-check-input" /> 리조트</label>
                </div>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="stay_type" value="렌탈하우스" class="form-check-input" /> 렌탈하우스</label>
                </div>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="stay_type" value="한옥" class="form-check-input" /> 한옥</label>
                </div>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="stay_type" value="캠핑&아웃도어" class="form-check-input" /> 캠핑&아웃도어</label>
                </div>
            </td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>숙소명</th>
            <td colspan="3">
                <input type="text" name="stay_name" value="" maxlength="50" class="form-control w-40" required />
            </td>
        </tr>
        <tr>
            <th>간략설명</th>
            <td colspan="3">
                <input type="text" name="stay_desc" value="" maxlength="50" class="form-control" />
            </td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>위치/주소</th>
            <td colspan="3">
                <input type="text" name="stay_location" value="" maxlength="50" class="form-control d-inline w-20" required />
                <input type="text" name="stay_addr" value="" maxlength="100" class="form-control d-inline w-70 ml-3" required />
            </td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><input type="text" name="stay_phone" value="" maxlength="15" class="form-control" required /></td>
            <th>이메일</th>
            <td><input type="text" name="stay_email" value="" maxlength="100" class="form-control" required /></td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>숙소 사진 1</th>
            <td colspan="3"><input type="file" name="stay_file1" class="form-control w-50" /></td>
        </tr>
        <tr>
            <th>숙소 사진 2</th>
            <td colspan="3"><input type="file" name="stay_file2" class="form-control w-50" /></td>
        </tr>
        <tr>
            <th>숙소 사진 3</th>
            <td colspan="3"><input type="file" name="stay_file3" class="form-control w-50" /></td>
        </tr>
        <tr>
            <th>숙소 사진 4</th>
            <td colspan="3"><input type="file" name="stay_file4" class="form-control w-50" /></td>
        </tr>
        <tr>
            <th>숙소 사진 </th>
            <td colspan="3"><input type="file" name="stay_file" class="form-control w-50" /></td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>숙박 옵션 1</th>
            <td colspan="3">
                <div class="row d-flex">
                    <div class="col-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션이름</span>
                            </div>
                            <input type="text" name="stay_option1_name" value="" maxlength="50" class="form-control" />
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션가격</span>
                            </div>
                            <input type="text" name="stay_option1_price" value="" maxlength="10" class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션설명</span>
                            </div>
                            <input type="text" name="stay_option1_desc" value="" maxlength="200" class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션사진</span>
                            </div>
                            <input type="file" name="stay_option1_photo" class="form-control w-50" />
                        </div>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <th>숙박 옵션 2</th>
            <td colspan="3">
                <div class="row d-flex">
                    <div class="col-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션이름</span>
                            </div>
                            <input type="text" name="stay_option2_name" value="" maxlength="50" class="form-control" />
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션가격</span>
                            </div>
                            <input type="text" name="stay_option2_price" value="" maxlength="10" class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션설명</span>
                            </div>
                            <input type="text" name="stay_option2_desc" value="" maxlength="200" class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션사진</span>
                            </div>
                            <input type="file" name="stay_option2_photo" class="form-control w-50" />
                        </div>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <th>숙박 옵션 3</th>
            <td colspan="3">
                <div class="row d-flex">
                    <div class="col-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션이름</span>
                            </div>
                            <input type="text" name="stay_option3_name" value="" maxlength="50" class="form-control" />
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션가격</span>
                            </div>
                            <input type="text" name="stay_option3_price" value="" maxlength="10" class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션설명</span>
                            </div>
                            <input type="text" name="stay_option3_desc" value="" maxlength="200" class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text rounded-0">옵션사진</span>
                            </div>
                            <input type="file" name="stay_option3_photo" class="form-control w-50" />
                        </div>
                    </div>
                </div>
            </td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>내용 컨텐츠 1</th>
            <td colspan="3"><textarea id="stay_content1" name="stay_content1" cols="80" rows="5"></textarea></td>
        </tr>

        <tr>
            <th>내용 컨텐츠 2</th>
            <td colspan="3"><textarea id="stay_content2" name="stay_content2" cols="80" rows="5"></textarea></td>
        </tr>

        <tr>
            <th>내용 컨텐츠 3</th>
            <td colspan="3"><textarea id="stay_content3" name="stay_content3" cols="80" rows="5"></textarea></td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>안내사항 1<br />(예약안내)</th>
            <td colspan="3"><textarea id="stay_info1" name="stay_info1" cols="80" rows="5"></textarea></td>
        </tr>

        <tr>
            <th>안내사항 2<br />(이용안내)</th>
            <td colspan="3"><textarea id="stay_info2" name="stay_info2" cols="80" rows="5"></textarea></td>
        </tr>

        <tr>
            <th>안내사항 3<br />(환불규정)</th>
            <td colspan="3"><textarea id="stay_info3" name="stay_info3" cols="80" rows="5"></textarea></td>
        </tr>

    </table>
    <script type="text/javascript">
    CKEDITOR.disableAutoInline = true;
    CKEDITOR.replace('stay_content1', { height: "250px" });
    CKEDITOR.replace('stay_content2', { height: "250px" });
    CKEDITOR.replace('stay_content3', { height: "250px" });
    CKEDITOR.replace('stay_info1', { height: "250px" });
    CKEDITOR.replace('stay_info2', { height: "250px" });
    CKEDITOR.replace('stay_info3', { height: "250px" });
    </script>



    <div class="gw-button">
        <div class="gwb-wrap">
            <div class="gwb-left"></div>

            <div class="gwb-center">
                <button type="button" class="btn btn-lg btn-outline-secondary mx-1" onclick="history.back();"><i class="fa fa-bars"></i> 목록보기</button>
                <button type="submit" class="btn btn-lg btn-primary mx-1"><i class="fa fa-pencil"></i> 등록하기</button>
            </div>

            <div class="gwb-right"></div>
        </div>
    </div>
    </form>
</div>





<jsp:include page="../layout/layout_footer.jsp" />