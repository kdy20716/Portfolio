# Mallang Blast - WebGL 포트폴리오 삽입 가이드 (16:9 PC 와이드스크린)

## 1. 포트폴리오 웹사이트에 iframe으로 삽입하기
좌우 사이드 윙 배경과 데코레이션이 잘리지 않고 모두 담긴 **16:9 와이드 화면**으로 포트폴리오 페이지(React, Vue, HTML 등)에 임베드할 수 있습니다.

```html
<!-- 말랑블라스트 게임 플레이 컨테이너 (16:9 PC 와이드스크린) -->
<div style="display: flex; justify-content: center; align-items: center; padding: 20px; background: #1a1a24; border-radius: 16px;">
    <div style="position: relative; width: 100%; max-width: 960px; aspect-ratio: 16/9; border-radius: 20px; overflow: hidden; box-shadow: 0 10px 30px rgba(0,0,0,0.5);">
        <iframe 
            src="/games/mallang-blast/index.html" 
            style="width: 100%; height: 100%; border: none;" 
            allow="autoplay; fullscreen" 
            title="Mallang Blast">
        </iframe>
    </div>
</div>
```

## 2. 배포 및 최적화 안내
- **좌우 잘림 없음 (16:9 원본)**: PC 버전의 양옆 파스텔 사이드 윙 아트와 반짝이 파티클이 온전히 표시됩니다.
- **용량 최적화 완료**: Gzip 압축 및 Decompression Fallback이 적용되어 GitHub의 100MB 파일 제한(현재 77MB)에 걸리지 않고 원활하게 푸시됩니다.
- **자동 저장 지원**: `autoSyncPersistentDataPath = true`가 적용되어 있어 브라우저 캐시에 플레이 기록이 안전하게 저장됩니다.
- **반응형 지원**: iframe 내부에서는 불필요한 푸터 없이 컨테이너 크기에 맞춰 100% 깔끔하게 채워집니다.
