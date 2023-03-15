import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';

import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'pixabay_api_test.mocks.dart';

//  flutter pub run build_runner build 터미널에 이것을 실행시켜주면 테스트가 된다.
// flutter 공식홈페이지에서 http test검색 후 mockito 들어가면 정보가 나온다
@GenerateMocks([http.Client])
void main() {
  test('Pixabay 데이터를 잘 가져와야 한다.', () async {
    final client = MockClient();
    final api = PhotoApiRepositoryImpl(PixabayApi(client));

    // 이동작을 했을 때 어떤 결과를 줄 것인지 동작을 정의하는 것 when
    when(client.get(Uri.parse(
            '${PixabayApi.baseUrl}?key=${PixabayApi.key}&q=iphone&image_type=photo&pretty=true')))
        .thenAnswer((_) async => http.Response(fakeJsonBody, 200));

    final result = await api.fetch('iphone');

    //동일한 값을 일반적으로 테스트한다.
    // 첫번째 아이디를 체크한다
    // expect(result.first.id, 2681039);
    // 들어온 json의 길이를 체크한다./
    expect((result as Success<List<Photo>>).data.first.id, 2681039);

    //실제로 잘 동작을 했는지 검증해주는 함수
    verify(client.get(Uri.parse(
        '${PixabayApi.baseUrl}?key=${PixabayApi.key}&q=iphone&image_type=photo&pretty=true')));
  });
}

String fakeJsonBody = """
{
    "total": 8732,
    "totalHits": 500,
    "hits": [
        {
            "id": 2681039,
            "pageURL": "https://pixabay.com/photos/phone-wallpaper-watercolor-painting-2681039/",
            "type": "photo",
            "tags": "phone wallpaper, watercolor, painting",
            "previewURL": "https://cdn.pixabay.com/photo/2017/08/25/18/48/watercolor-2681039_150.jpg",
            "previewWidth": 99,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g5f77acb7f4008dfeede306e25800fd963d4353f902d874f5f312878c76536a0ed7805366807d9ac1b9f152807e42fd47f6951db1dad75ede7fbc6671fc7ed03b_640.jpg",
            "webformatWidth": 424,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g0f8001d1d12559d685810db322ecca8529bf7a5f087f1c9e87d76ccec698f512f74e192912fbf84c0410379bd2c9a72fcb62531dd87dd27042fc7805728320df_1280.jpg",
            "imageWidth": 3264,
            "imageHeight": 4928,
            "imageSize": 5021313,
            "views": 1200928,
            "downloads": 932774,
            "collections": 1929,
            "likes": 1237,
            "comments": 134,
            "user_id": 4894494,
            "user": "eluela31",
            "userImageURL": "https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"
        },
        {
            "id": 1599527,
            "pageURL": "https://pixabay.com/photos/phone-wallpaper-mystery-island-1599527/",
            "type": "photo",
            "tags": "phone wallpaper, mystery, island",
            "previewURL": "https://cdn.pixabay.com/photo/2016/08/17/01/39/mystery-1599527_150.jpg",
            "previewWidth": 116,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/gc486505e920df2bddbdc986db257a239868a0282b897a687ce8ab5fd556e652b619c0e217cab3241c7195cd93f33efa972540bb11dfeb5b537ad86ee43cd98bf_640.jpg",
            "webformatWidth": 495,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g14835df6ae8468cab667193a4325a7e4d4d1eca5af15b14d4404e7ed68c7e13920fbf63af569cedfba3607d6908d52aebc9ee518255c09d42a0568dfc6a762c4_1280.jpg",
            "imageWidth": 3022,
            "imageHeight": 3907,
            "imageSize": 3563541,
            "views": 815116,
            "downloads": 457325,
            "collections": 1414,
            "likes": 1362,
            "comments": 167,
            "user_id": 2633886,
            "user": "intographics",
            "userImageURL": "https://cdn.pixabay.com/user/2019/02/11/15-00-48-80_250x250.jpg"
        },
        {
            "id": 620817,
            "pageURL": "https://pixabay.com/photos/office-notes-notepad-entrepreneur-620817/",
            "type": "photo",
            "tags": "office, notes, notepad",
            "previewURL": "https://cdn.pixabay.com/photo/2015/02/02/11/08/office-620817_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g7a5b04c6ce08cee593e182e3a748adc088df6a277ae780ec193bfcf89490ad5cc5435b6e4798485e4c264b91a7ab0c14_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 425,
            "largeImageURL": "https://pixabay.com/get/g7bba61db1dcc6fc0ea13dd7f7d5312b56e8af2e69505a33c35da9f340bef48d76e0d1e7ed611410afcd0f945ec7079706bdf695e3f6ae481f26090ca90f8ce9f_1280.jpg",
            "imageWidth": 4288,
            "imageHeight": 2848,
            "imageSize": 2800224,
            "views": 769985,
            "downloads": 338262,
            "collections": 1354,
            "likes": 1149,
            "comments": 267,
            "user_id": 663163,
            "user": "Firmbee",
            "userImageURL": "https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"
        },
        {
            "id": 1914130,
            "pageURL": "https://pixabay.com/photos/phone-wallpaper-spices-spoons-salt-1914130/",
            "type": "photo",
            "tags": "phone wallpaper, spices, spoons",
            "previewURL": "https://cdn.pixabay.com/photo/2016/12/17/18/51/spices-1914130_150.jpg",
            "previewWidth": 133,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g56a14029e829ed2838a39f6cd35b92e9e27c738844dc0fb4a17836be9edeb9d27678ca4041a162265dabc2daaa1b094af6dd80b27d7216ea4c1a7e419ba72c24_640.jpg",
            "webformatWidth": 571,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g9a8170b357de41ef140a43563f1c05a985c9eca7b2cc5bde63862c97106d9d947ac38d8295d07db98d8bc13e087d0d2c40a0bf39c83fa2fb393ab0f12aa43852_1280.jpg",
            "imageWidth": 3581,
            "imageHeight": 4013,
            "imageSize": 6193655,
            "views": 480382,
            "downloads": 314570,
            "collections": 1183,
            "likes": 1239,
            "comments": 166,
            "user_id": 3938704,
            "user": "Daria-Yakovleva",
            "userImageURL": "https://cdn.pixabay.com/user/2016/12/06/15-05-11-524_250x250.jpg"
        },
        {
            "id": 1979674,
            "pageURL": "https://pixabay.com/photos/relaxing-lounging-saturday-cozy-1979674/",
            "type": "photo",
            "tags": "relaxing, lounging, saturday",
            "previewURL": "https://cdn.pixabay.com/photo/2017/01/14/15/11/relaxing-1979674_150.jpg",
            "previewWidth": 150,
            "previewHeight": 102,
            "webformatURL": "https://pixabay.com/get/g66214958a893287ac4db5f9164d4bf570e6838fe474decf11b422a2f1c5ee3d20b283128f36de006397df9b72685d125c579dabdcd42453ae111789004006cd8_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 438,
            "largeImageURL": "https://pixabay.com/get/gddc8ac736ac994336bde9abb76fd50957a2f0ba215cab61bac0d10f8e5482b0d539a0e1bc4e3c2b77816306481b5bb285e03c41caf68ab644c3069937c608a74_1280.jpg",
            "imageWidth": 5310,
            "imageHeight": 3637,
            "imageSize": 3751070,
            "views": 440655,
            "downloads": 252839,
            "collections": 1053,
            "likes": 1186,
            "comments": 151,
            "user_id": 334088,
            "user": "JillWellington",
            "userImageURL": "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
        },
        {
            "id": 410324,
            "pageURL": "https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/",
            "type": "photo",
            "tags": "iphone, smartphone, apps",
            "previewURL": "https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/gfe2b21a763f31bed916c7b21e03d38fb506b6013f96e680d4f43fa0f36c7d842d11b4f6ece3d05c34b7cf5d9e5967ac9_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/g27698a4b5045fe933158adb25efe949a62cd1cb63e219c17d124443a1f4aa021ad5b6b89286d1779956c0ac5274fd63a3bd0a0360b95577e5ae29c3bdacf0c19_1280.jpg",
            "imageWidth": 2180,
            "imageHeight": 1453,
            "imageSize": 477025,
            "views": 778383,
            "downloads": 457975,
            "collections": 904,
            "likes": 815,
            "comments": 222,
            "user_id": 264599,
            "user": "JESHOOTS-com",
            "userImageURL": "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
        },
        {
            "id": 2846221,
            "pageURL": "https://pixabay.com/photos/business-computer-mobile-smartphone-2846221/",
            "type": "photo",
            "tags": "business, computer, mobile",
            "previewURL": "https://cdn.pixabay.com/photo/2017/10/12/22/17/business-2846221_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g366990ee83f89ff362d5e28e150e545ad345cb0837681029284159b3a576390d41932d10b7658694376dfda42b7d8d6364ebff60760cad2893afcb49d6e397be_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/g86ffda011d95b0b8a548be06b3df6ab045e16aa67b42c271bed98f97481806c0d139c215bfb174efaeade9fe13938165043fd750ae2b976a8a0bc57b40307315_1280.jpg",
            "imageWidth": 4608,
            "imageHeight": 3072,
            "imageSize": 2543501,
            "views": 434465,
            "downloads": 308497,
            "collections": 1078,
            "likes": 643,
            "comments": 103,
            "user_id": 6689062,
            "user": "6689062",
            "userImageURL": ""
        },
        {
            "id": 459196,
            "pageURL": "https://pixabay.com/photos/macbook-laptop-google-display-459196/",
            "type": "photo",
            "tags": "macbook, laptop, google",
            "previewURL": "https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196_150.jpg",
            "previewWidth": 150,
            "previewHeight": 92,
            "webformatURL": "https://pixabay.com/get/gf7605572159be5c14eedb03eec8e316941b0b8558932f5e2846144265f2cc04feb17e99960f1fb7efc5ba61f84ed4c97_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 396,
            "largeImageURL": "https://pixabay.com/get/g6fc0c2566edc68403e9ab304caebe4888f0875bfd8865f5b036d4e1e8cd27ffbfcc07452fe943e8921c7d98ae188a871e8e646d4c9b16e3f7ccbb7236432a20d_1280.jpg",
            "imageWidth": 3888,
            "imageHeight": 2406,
            "imageSize": 2883743,
            "views": 596222,
            "downloads": 304062,
            "collections": 812,
            "likes": 773,
            "comments": 221,
            "user_id": 377053,
            "user": "377053",
            "userImageURL": ""
        },
        {
            "id": 1213475,
            "pageURL": "https://pixabay.com/photos/phone-wallpaper-heart-clouds-sky-1213475/",
            "type": "photo",
            "tags": "phone wallpaper, heart, clouds",
            "previewURL": "https://cdn.pixabay.com/photo/2016/02/21/12/09/heart-1213475_150.jpg",
            "previewWidth": 100,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g391447dbc144b3fbb0f2ed24208ff2f9cf57e06925fcfc96999cb3810e7141b470130ce757c3be55300e3e11f1782ace5abd0ecacd473b807fe4ce7fc02a33d6_640.jpg",
            "webformatWidth": 427,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/ga444c1b6462cdb788fb4c6bdce8b744b36fdfb704ce1ea759f0944eb56abcdebc033cee0f51f5f957b18f7204718d3780327c44d3ef30e8b8b41223739ddfcfe_1280.jpg",
            "imageWidth": 1667,
            "imageHeight": 2500,
            "imageSize": 656080,
            "views": 704968,
            "downloads": 515906,
            "collections": 841,
            "likes": 835,
            "comments": 115,
            "user_id": 848168,
            "user": "oo11o",
            "userImageURL": ""
        },
        {
            "id": 3746423,
            "pageURL": "https://pixabay.com/photos/ruin-castle-middle-ages-dramatic-3746423/",
            "type": "photo",
            "tags": "ruin, castle, middle ages",
            "previewURL": "https://cdn.pixabay.com/photo/2018/10/14/13/01/ruin-3746423_150.jpg",
            "previewWidth": 106,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/gedb6892fc308c4e8fcfe32fe6875753d45175227e503e194c94a42feb7f86b891c5aa1c0ba09f8b54a0b6d9415a9b19edd60d26294fe6a712011e2d62bf8d48d_640.jpg",
            "webformatWidth": 452,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/gd44b2d5f7372f3d2a3c0635c604f070b6ae0b4147dd673d4e35910b3da42258001c437b5434a34f8bf8b79a5df8ad564b9cd24876bfbc69563b42e0e8ee5bece_1280.jpg",
            "imageWidth": 3508,
            "imageHeight": 4961,
            "imageSize": 4680479,
            "views": 324497,
            "downloads": 271847,
            "collections": 842,
            "likes": 693,
            "comments": 135,
            "user_id": 1664300,
            "user": "Darkmoon_Art",
            "userImageURL": "https://cdn.pixabay.com/user/2022/09/27/12-51-07-71_250x250.jpg"
        },
        {
            "id": 3076954,
            "pageURL": "https://pixabay.com/photos/desk-smartphone-iphone-notebook-3076954/",
            "type": "photo",
            "tags": "desk, smartphone, iphone",
            "previewURL": "https://cdn.pixabay.com/photo/2018/01/11/21/27/desk-3076954_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g20c514e3e8adf568c8d554375ec46052ae3ca791bee6b7c47ffb1f51715b733fd8deedb4ad5017c32b262ba32374ccd2decef5c211d5d6c45ab7186d078b8ce1_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/g3582032b2d126c43c5c3b44250e0834acec325be2f329da194fd0dc3e3bfa535f041e19af3b8df38974676319825cb3d0b1f08d5e2c89e90e9a1f9852f3cce2b_1280.jpg",
            "imageWidth": 5304,
            "imageHeight": 3531,
            "imageSize": 2258922,
            "views": 261290,
            "downloads": 166261,
            "collections": 934,
            "likes": 591,
            "comments": 105,
            "user_id": 2218222,
            "user": "Ylanite",
            "userImageURL": "https://cdn.pixabay.com/user/2021/11/18/21-11-44-855_250x250.png"
        },
        {
            "id": 1842202,
            "pageURL": "https://pixabay.com/photos/camera-phone-picture-capture-1842202/",
            "type": "photo",
            "tags": "camera, phone, picture",
            "previewURL": "https://cdn.pixabay.com/photo/2016/11/20/08/33/camera-1842202_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/g7cc33dff943bbddd76c9a46abefec0b37153d71cc741adcdd58c6b4484e5c263fb3a32fafbe0640ab7aaa00ce079de194d7ff4b1559fb034b20504575829e697_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/g05243917a1663242ced1aecdd526e0eb8e327edd93c77d003882e159869510fca39267f1b9a58340cbb87dd8cc5f53e9fb53fdfedcba67c39d59b0eb38e41ae2_1280.jpg",
            "imageWidth": 5472,
            "imageHeight": 3648,
            "imageSize": 2581728,
            "views": 107731,
            "downloads": 59283,
            "collections": 1358,
            "likes": 139,
            "comments": 33,
            "user_id": 2286921,
            "user": "Pexels",
            "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
        },
        {
            "id": 298243,
            "pageURL": "https://pixabay.com/photos/smoke-abstract-background-fumes-298243/",
            "type": "photo",
            "tags": "smoke, abstract, background",
            "previewURL": "https://cdn.pixabay.com/photo/2014/03/25/22/53/smoke-298243_150.jpg",
            "previewWidth": 100,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/gbafd8338fce11da6a1f571cc68a4a4f39dcd6063b5590006bb4baa76e28d0c616edc5aa4368148aca69f27e2837557b6_640.jpg",
            "webformatWidth": 425,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/gd55831392bfd784be25920da80f207b6c5c661e8e1e4a91999cf7406dfcd9756725145dc4ae5aeff826c12a0adc0ad56bd46cbc9589c9dab40649c68f1d47692_1280.jpg",
            "imageWidth": 2848,
            "imageHeight": 4288,
            "imageSize": 2236073,
            "views": 629416,
            "downloads": 462105,
            "collections": 760,
            "likes": 648,
            "comments": 107,
            "user_id": 168090,
            "user": "goranmx",
            "userImageURL": ""
        },
        {
            "id": 2369664,
            "pageURL": "https://pixabay.com/photos/art-multicoloured-to-dye-abstract-2369664/",
            "type": "photo",
            "tags": "art, multicoloured, to dye",
            "previewURL": "https://cdn.pixabay.com/photo/2017/06/03/20/12/art-2369664_150.jpg",
            "previewWidth": 99,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/gb47e72f6af4cc5b2f2dae9523a191823da69e0f1a2442eeedd50c07262cc26ca23aa4e7388f6cb4b40fc761e873e2c6308280c97a7c38d56a269c109044c7088_640.jpg",
            "webformatWidth": 424,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g7aeb43e01332984ad915b889f23bd2829433419b84cec31f22e63ba713c335ef6419b35e99ebdf99bec0a80da660cc43e813c792dceef531b29d320f4a08a2e4_1280.jpg",
            "imageWidth": 3264,
            "imageHeight": 4928,
            "imageSize": 4032363,
            "views": 534321,
            "downloads": 471957,
            "collections": 851,
            "likes": 594,
            "comments": 70,
            "user_id": 4894494,
            "user": "eluela31",
            "userImageURL": "https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"
        },
        {
            "id": 1659054,
            "pageURL": "https://pixabay.com/photos/grass-lawn-garden-park-ground-1659054/",
            "type": "photo",
            "tags": "grass, lawn, garden",
            "previewURL": "https://cdn.pixabay.com/photo/2016/09/10/12/40/grass-1659054_150.jpg",
            "previewWidth": 81,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/gd3347dd0e64276310580c10df91bb1202f2c81e211ef6cf348c62e8c77dfb7e59890cf5e81cf8a26e01380ce126bfe742b4042f7802a803ef642dc094efc2706_640.jpg",
            "webformatWidth": 346,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g3e2f90d6bf5338c17c3ced4d5e9d69da3c4591e72eced86840a28890eda7355fa93a181843707a5476175c6b79900ebc7f01749548d0cd1ffa25f47b8e5747aa_1280.jpg",
            "imageWidth": 2659,
            "imageHeight": 4911,
            "imageSize": 8444898,
            "views": 474102,
            "downloads": 389421,
            "collections": 797,
            "likes": 628,
            "comments": 91,
            "user_id": 1594796,
            "user": "jeonsango",
            "userImageURL": "https://cdn.pixabay.com/user/2016/04/22/14-26-25-744_250x250.jpg"
        },
        {
            "id": 410311,
            "pageURL": "https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/",
            "type": "photo",
            "tags": "iphone, hand, screen",
            "previewURL": "https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg",
            "previewWidth": 150,
            "previewHeight": 99,
            "webformatURL": "https://pixabay.com/get/gf7e0aaf2cfc509ae3c1278374e29669de5078fb751d00446bae3fec052aa66ee10428bf697aa30ed34aed93edc08ffd2_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 426,
            "largeImageURL": "https://pixabay.com/get/gf0f71683fca4bf4e89bdb58aa698073f143ee617548867e9d46f3c063b58571354ccd21714095bfb9afc65d61f249ae550bd328e0c2c184dcf39c91a43d132c7_1280.jpg",
            "imageWidth": 1920,
            "imageHeight": 1280,
            "imageSize": 416413,
            "views": 556584,
            "downloads": 280054,
            "collections": 640,
            "likes": 612,
            "comments": 168,
            "user_id": 264599,
            "user": "JESHOOTS-com",
            "userImageURL": "https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"
        },
        {
            "id": 1052023,
            "pageURL": "https://pixabay.com/photos/glasses-book-phone-iphone-1052023/",
            "type": "photo",
            "tags": "glasses, book, phone",
            "previewURL": "https://cdn.pixabay.com/photo/2015/11/19/21/14/glasses-1052023_150.jpg",
            "previewWidth": 150,
            "previewHeight": 112,
            "webformatURL": "https://pixabay.com/get/g12720fb8e0bd4fb3dbb15264a57c047e1fc781c0006ba5fc38f2dd4a698da203267a00cc75d3efb90a0471d92c069826d8a508265ac444117cb8a42dd4fbf15c_640.jpg",
            "webformatWidth": 640,
            "webformatHeight": 480,
            "largeImageURL": "https://pixabay.com/get/gc842607301db26b11f98cab31c1b82de110f71e2fbabbee544e452dbc04a9ba8c8b03fbfa6d0eff5ce8556f73451ef939f6d026bd35af8c6ec5864992172e1a6_1280.jpg",
            "imageWidth": 4533,
            "imageHeight": 3400,
            "imageSize": 3219890,
            "views": 294910,
            "downloads": 178736,
            "collections": 654,
            "likes": 597,
            "comments": 84,
            "user_id": 1441456,
            "user": "DariuszSankowski",
            "userImageURL": "https://cdn.pixabay.com/user/2015/12/21/10-54-58-771_250x250.jpg"
        },
        {
            "id": 1850893,
            "pageURL": "https://pixabay.com/photos/morning-bedroom-bed-door-girl-1850893/",
            "type": "photo",
            "tags": "morning, bedroom, bed",
            "previewURL": "https://cdn.pixabay.com/photo/2016/11/22/22/18/morning-1850893_150.jpg",
            "previewWidth": 100,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g78614ee2bdeed4b48ea086a48b516f84e4a9cda577a63bcfd3c1c1a69976b00cf5de2b3871cfbde085f92af1004e297aa32fe9f99ae29350ffd7350de7009414_640.jpg",
            "webformatWidth": 426,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/gea7670a123263de9b28f6240a98655fea7252e22a2299434be3da2e9a0017fe032c3e5b2c36f1220b0c8f442b549692bf6c5e0fcb50ed35f0c380021a2cbb1ca_1280.jpg",
            "imageWidth": 3264,
            "imageHeight": 4896,
            "imageSize": 1383694,
            "views": 187549,
            "downloads": 117780,
            "collections": 686,
            "likes": 481,
            "comments": 51,
            "user_id": 2286921,
            "user": "Pexels",
            "userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
        },
        {
            "id": 1807521,
            "pageURL": "https://pixabay.com/photos/hot-air-balloons-bagan-sunset-1807521/",
            "type": "photo",
            "tags": "hot air balloons, bagan, sunset",
            "previewURL": "https://cdn.pixabay.com/photo/2016/11/08/05/18/hot-air-balloons-1807521_150.jpg",
            "previewWidth": 105,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/g9c88da61c7734448d0df2ff97a2e34188dce1a9d708e0e3432a9d65f9a12f6226f2bd366a2845f14fb9f09019fb3054bb51374764bf67d57c547f1997aaafd6a_640.jpg",
            "webformatWidth": 450,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g84cafab218ade52e5e0313152196a6fab91751ba8680987683cf0c73ed317b10b9b0c2fd72c7d42aaf1bf9cf196f37d2610023e0179e8f7491f35bd9e51ecb64_1280.jpg",
            "imageWidth": 2504,
            "imageHeight": 3558,
            "imageSize": 2054554,
            "views": 474034,
            "downloads": 286135,
            "collections": 609,
            "likes": 525,
            "comments": 35,
            "user_id": 3639875,
            "user": "sasint",
            "userImageURL": "https://cdn.pixabay.com/user/2016/10/30/05-50-54-750_250x250.jpg"
        },
        {
            "id": 3354062,
            "pageURL": "https://pixabay.com/photos/water-waterfall-outdoors-adult-3354062/",
            "type": "photo",
            "tags": "water, waterfall, outdoors",
            "previewURL": "https://cdn.pixabay.com/photo/2018/04/27/08/55/water-3354062_150.jpg",
            "previewWidth": 120,
            "previewHeight": 150,
            "webformatURL": "https://pixabay.com/get/gc6c0def4c30ae0dc98c114ec4facf51669cfe4314600cba02849b54be32184f2a93af2aa395491a7d16b3d32e70a92688cc22fc35539d0e2aafd050706bb110e_640.jpg",
            "webformatWidth": 512,
            "webformatHeight": 640,
            "largeImageURL": "https://pixabay.com/get/g317b9bc9288f592df8a154451e092864bfab801c062d6f417bee780e5274149bcae6608f669fbe8a5161533aacb8756cded88b0485b9336a17bd45e9a66744d3_1280.jpg",
            "imageWidth": 3712,
            "imageHeight": 4640,
            "imageSize": 4537291,
            "views": 393001,
            "downloads": 307682,
            "collections": 574,
            "likes": 508,
            "comments": 48,
            "user_id": 8807492,
            "user": "ollivves",
            "userImageURL": "https://cdn.pixabay.com/user/2018/04/26/09-00-53-532_250x250.jpg"
        }
    ]
}
""";
