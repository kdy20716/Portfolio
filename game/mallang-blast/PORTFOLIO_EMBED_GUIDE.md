# 🎮 말랑블라스트 (Mallang Blast) WebGL 포트폴리오 삽입 가이드

본 빌드는 포트폴리오 웹사이트에 즉시 임베드할 수 있도록 **웹 호환 무압축(Uncompressed) 모드**, **9:16 모바일 뷰 비율**, **IndexedDB 데이터 자동 저장(AutoSync)**이 적용된 완성형 WebGL 빌드입니다.

---

## 1. 파일 구성
```text
Builds/MallangBlast_WebGL/
├── index.html                     # 게임 단독 실행 및 iframe 임베드용 메인 HTML
├── PORTFOLIO_EMBED_GUIDE.md        # 본 가이드 문서
├── Build/
│   ├── MallangBlast_WebGL.loader.js      # 유니티 웹 로더
│   ├── MallangBlast_WebGL.framework.js   # 런타임 프레임워크
│   ├── MallangBlast_WebGL.wasm           # WebAssembly 게임 로직 (55.9MB)
│   └── MallangBlast_WebGL.data           # 그래픽/사운드 게임 리소스 (182MB)
└── TemplateData/                         # 웹 로딩바, 아이콘, 스타일시트
```

---

## 2. 포트폴리오 웹사이트에 삽입하는 방법 (HTML / iframe)

포트폴리오 웹페이지의 원하는 위치에 아래 코드를 추가하시면 9:16 스마트폰 비율의 모던한 게임 플레이 카드로 자연스럽게 연출됩니다.

```html
<!-- 말랑블라스트 포트폴리오 쇼케이스 카드 -->
<div style="display: flex; justify-content: center; align-items: center; padding: 24px; background: #181824; border-radius: 20px;">
    <div style="position: relative; width: 100%; max-width: 480px; aspect-ratio: 9/16; border-radius: 24px; overflow: hidden; box-shadow: 0 15px 40px rgba(0,0,0,0.6); border: 2px solid #2e2e42;">
        <iframe 
            src="/mallang-blast/index.html" 
            style="width: 100%; height: 100%; border: none;" 
            allow="autoplay; fullscreen; gamepad" 
            loading="lazy"
            title="Mallang Blast">
        </iframe>
    </div>
</div>
```
*(※ `src="/mallang-blast/index.html"` 경로는 포트폴리오 프로젝트의 정적 파일 폴더(`public/` 등) 위치에 맞춰 지정해 주시면 됩니다)*

---

## 3. React / Next.js 컴포넌트 예시

```tsx
export function MallangBlastGame() {
  return (
    <div className="flex justify-center items-center py-6 bg-slate-950 rounded-2xl">
      <div className="w-full max-w-[460px] aspect-[9/16] rounded-3xl overflow-hidden shadow-2xl border border-slate-800">
        <iframe
          src="/games/mallang-blast/index.html"
          className="w-full h-full border-0"
          allow="autoplay; fullscreen"
          title="Mallang Blast WebGL"
        />
      </div>
    </div>
  );
}
```

---

## 4. 로컬에서 바로 테스트해보기

웹 브라우저의 보안 정책(CORS)으로 인해 `index.html`을 파일 탐색기에서 단순히 더블클릭(`file:///`)하기보다는 **로컬 웹 서버**로 여는 것이 권장됩니다.

1. **VS Code 이용 시**:
   - `MallangBlast_WebGL` 폴더를 VS Code로 열고, 하단의 **[Go Live]** (Live Server 확장 기능) 클릭
2. **터미널 이용 시 (Node.js)**:
   - 해당 폴더에서 다음 명령어 실행:
     ```bash
     npx serve .
     ```
   - 브라우저에서 `http://localhost:3000` 접속

---

## 5. 배포 시 꿀팁

- **호환성 100%**: 서버 측 Brotli/Gzip 압축 헤더 미설정으로 인한 WebGL 파싱 오류(Content-Encoding 에러)가 발생하지 않도록 **무압축 원본 모드**로 빌드되었습니다. **GitHub Pages, Vercel, Netlify, Cloudflare Pages, S3** 등에 폴더째 업로드하면 즉시 작동합니다.
- **점수 및 설정 자동 저장**: 브라우저의 `IndexedDB`와 자동 연동되어 있어, 포트폴리오 방문자가 게임을 껐다 켜도 **최고 기록과 볼륨 설정이 브라우저에 그대로 유지**됩니다.
