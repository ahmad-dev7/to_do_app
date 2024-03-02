'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "a0d6319dfbcd46dd646e26a0d65f66f0",
".git/config": "a5082e11091b9639225cc6915c1849aa",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "341bc8433f54c06f9cb2fe34b51d4ce4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "a413500fa0b5a6c019660803f1e9506a",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "9fb6b53751c28ed6e60b93570e73a5d1",
".git/logs/refs/heads/master": "e2b94adfe302782dbd29d2ec3eae2e57",
".git/logs/refs/heads/to_do_web": "bafc8227dc1e77d31a69465b1d4f9917",
".git/logs/refs/remotes/origin/to_do_web": "ac360ae5d985646906951f7f7c42936c",
".git/objects/1d/91f8436fa775b5262315391e48c407d232fa8d": "970cb8a3e06b28b8c9210706ce955fa6",
".git/objects/2b/71bcda8d73430698490aab3e89802145f7d580": "c7e841ddd0eded8ba3021993e0286fad",
".git/objects/2e/f58be245096e0f4bf587b40e40dbee3aa126eb": "4086a1cc6c1a266d43093bbfe18485b4",
".git/objects/34/6d05b76a1a518ef74646d6c2875d41b7433300": "aca62732721d9d0053c60f29e7486f1d",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/3f/15d3992c85428deed5936ea2278bd07fe22e6f": "4961bcef985c83dd7468a54ae7d858bc",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/f96355823518c6cf9b04be06ec95c56b431a12": "31a9a6232de987fd8842876e56cb75e6",
".git/objects/4e/377492f5b610fecdcbe78590451fbd7caceddd": "07e1a967f2ab7751e5606df9899e19a4",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "970aec5149a3dbe9370a9dc982cdd022",
".git/objects/5d/92d8a6b55726518d0cf7bac6d8daae45fe0cdd": "8e52875bc5cc00f78a8fab1ecc85e354",
".git/objects/5f/1a35111fd0450121da9fa4f5f1dc6e023bccce": "8edbbc1854269f83a9b49593fcdf1e2d",
".git/objects/6b/36935acfcd33086c50e07427150d1f401c2cc2": "c1819868c08b4800bdee80975c28b3e7",
".git/objects/7f/daafea7198b19fa04789d093aa485b8244e0bf": "4a0b85a16e33c0a19a1c498f06087cb4",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/95/a4efa9548838288c6c8dbfdf04fae2414b4c21": "490d1729b438f1086aef4f012e590052",
".git/objects/9a/10e9dcf4d638befd4b8a1a528ff74c27d960a0": "ae4071b9444902697613546cf0d85e46",
".git/objects/9d/5f886353dcff6c222439cc1118e77eb1b007ea": "a87ff240c6e149d1ce495643e49417f9",
".git/objects/a5/a1d62841260353d538fec0843a9ca5fb193d03": "0908a4dd373b516810175f702236fc79",
".git/objects/b3/8a67a5af89a7f90048ff58588ab1ab23256d47": "7394a65940c428ea9fc9442e54bfb089",
".git/objects/b6/5ee983845517266626b0cdbc34d17b83ea517e": "974691fcd6ab1a6e0cd5d3e0355b4066",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/f454fdf8cc2ec41c0436dbc0f4aa964889e4e7": "be7fe3fca19cf083db1b8cdf26ebce27",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/c2/d8d2f44dd987786bbc249d4ad7bac3360f4811": "1926a57b256d9def261ccf6dc2914f65",
".git/objects/ca/63f022aa25b9a4f8c031b5d53616f2f5d1f6f5": "7ac610d0c5f83a53c4eb418a64f83535",
".git/objects/cd/a9a243c73a1114b00dc6a6ec36f81063677d03": "1bc230da82744a1389b8bd9986db1162",
".git/objects/ce/880321f228cc77dfa6d32492f57da6d1f23352": "a99f60f2f122844db18c407c934c83c4",
".git/objects/d0/31146057bcf64056d510db9ebe8b3455783240": "e0d8ee647a2349200d3a552d24e93e93",
".git/objects/d2/95fd52d0343565abdbc84abec859772aeafc56": "a046665bf06f113d7ccc40ac085ccfa5",
".git/objects/d3/a6a67a5eeb2f84463de48dba175a5764523027": "ebfaa11ae784f72765ace0c6b0affb16",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/d5/8326088cb11faf28fdba79578ba171b0e2ee37": "3cc458d308f32d436eaeaeaae349eaec",
".git/objects/d5/b54bd4a898b373f82bb1fa52b9580e7a976e3e": "943e27e1d359e2bc22daf20c70287c19",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "d7280a766a5d6033f187d874a92b5ad6",
".git/objects/df/7d2dcb89ab89da87467c0e1059b38c8d8f9296": "a44162ff357b024e4638ab18a9bb01c7",
".git/objects/df/a1b9d4da3ee7fffa4e8427256da7d654dd0994": "f193202175c7a69c79573e5b9b2302ba",
".git/objects/e0/49c81f7cb35ebc411a3e1b547bf4ccf91292e8": "efad70dc0ca77a90ee53b5cc3be528ca",
".git/objects/e0/e7e7c85e8a90570ac96c94b8caed187bb0524c": "e6c802efa8063d0097313bbd0bfe6dcf",
".git/objects/e2/c036986ecabad563d65c9f9c4bac2340e013a0": "a46af4a0335db09a025a29c96e5d3689",
".git/objects/e2/ff5865b192241d53935e77de70a4e6dff2847a": "cad1058aedc6c21a518b3cb00af21fac",
".git/objects/e6/46d591f99adb142edab348e5d728ad2bddc4a3": "7630b34441d494db3bf4d884cd250e72",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "2933b2b2ca80c66b96cf80cd73d4cd16",
".git/objects/e9/8f62931ad93e160670f525cdb328cd28343c9c": "e23235d9b3f96b430a4886a751ec0c03",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f3/55f80386be6fe031a77b21b9fb8aa1a063354e": "fc5c0981eb3c55257239412d2f6282e2",
".git/objects/f4/58ebbac1155143ecf7b3ee1dd86672a7cf3d56": "977fb8d23d2b10c6243f95cdcc70a272",
".git/objects/fc/76dddc4d1c71b781b03a07d96837c82e17cdaf": "38e4fa5482eacb375991ef5019ebc3f5",
".git/objects/fc/de1bb3df8c330568f07ef326d43d8ae3562897": "6e5bf2450330342c243afc3723b9c27e",
".git/objects/fd/b4f4a2d68a6faced07a4f225fb98e73c41fbdb": "6545ceb7fb0bb07b5b262282d730f652",
".git/refs/heads/master": "61274b6a1743d135abab5dca9257c993",
".git/refs/heads/to_do_web": "61274b6a1743d135abab5dca9257c993",
".git/refs/remotes/origin/to_do_web": "61274b6a1743d135abab5dca9257c993",
"assets/AssetManifest.bin": "47e8fe5380133444c184ad3a48d99e39",
"assets/AssetManifest.json": "656ae5d3506fb9409f9ac28a956106c6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "94888e8402b56333b878809b80c1ead2",
"assets/images/animation.json": "042a7313adf949c4d3bac66e298b21cb",
"assets/images/app_icon_image.jpg": "33942e1ad6f3265571fc660f2445cc73",
"assets/images/background.png": "fb0a97a9aa9ca8cf60bfe22ff8104044",
"assets/images/celebration.json": "1808204e27a90a6e34ad41257c316345",
"assets/images/delete.json": "a7741eb68a045340c5fe9917495a4425",
"assets/images/diary_cover.jpg": "3a06e633844fe050349a008fe043a2be",
"assets/images/list_icon.png": "6dde4f84752f5cfe83f7e3a48808ff13",
"assets/images/motivational_image.jpg": "a402ed9e95a3eaf0a9fe9066b6048c07",
"assets/images/silver-cloth-abstract-background.jpg": "ae4e4d11dc53cf5ae6df8e8efa2bc8ef",
"assets/images/splash_animation.json": "912fec5a2becdfb387e6e602b1794707",
"assets/images/titanium_sheet.jpg": "7aac831a437e0eeb8bb834e5d77c153d",
"assets/images/toDoIcon.png": "1c55cd379a7fb450a095c2291759250c",
"assets/images/update.json": "b08cca1b91ce0770aef36405c5a08e15",
"assets/images/wavy_lines.jpg": "a0ff78871c3a5cbdfbd3676a97416d96",
"assets/images/write_animation.json": "777aa5294f8cd1a39a8ef95b3ab97d9c",
"assets/NOTICES": "152457d3c11179ba140668745e9779c1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "2d50bbcc2e4badd8da6b3dff18cc50fa",
"/": "2d50bbcc2e4badd8da6b3dff18cc50fa",
"main.dart.js": "d226745376288613e3fe65a73e02999b",
"manifest.json": "9698c35412a8b1ca29acd9ceb4b653cf",
"version.json": "99e94e431ec6d89d0d6aa3372dd9f5cc"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
