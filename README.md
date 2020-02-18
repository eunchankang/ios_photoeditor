# AVCamfilter(apple example project) 와 Cocoapods 'PixelEditor', 'PixelEngine'활용한 카메라 필터/에디터 앱

##카메라 
CameraViewController 에 작성. 현재 애플 소스코드의 필요없는 부분이 많이 섞여있음. 기본적인 카메라 기능과 전면/후면 전환, 필터 적용 기능이 있음. 메인 스토리보드의 나머지 버튼은 앱을 실행했을 때 나타나지 않아서 그대로 놔둠. 

##필터
실제로 필요한 부분은 RosyICRenderer.swift 소스코드에서는 Rosyfilter 하나만을 위한 Renderer 였으나 필터이름 array를 추가하여 슬라이드로 필터 전환이 가능하게 함. 
TODO// ICfilter 중 ICPhotofilter 를 적용하면 camerapreview에도 적용될 줄 알았으나 사진에만 적용되는 필터여서 ICColorMatrix 필터를 적용, 메트릭스를 조작하여 필터를 작성 후 바꿔야 할 것으로 보임 

##PhtoEditor
Cocoapods라이브러리를 활용하여 PreViewViewController 작성. 
라이브러리가 업데이트가 된건지, configuration 파일의 충돌로 pods 폴더 내 파일의 문제가 있는 건지 예시코드가 오류가 나는 부분이 많았고 (특히 Pods/PhotoEngine/ImageSource.swift) 오류 해결 후 실행이 되나 필터 collectionview에서 normal필터 외의 다른 필터가 나타나지 않음. 
