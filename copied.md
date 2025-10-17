<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Show Images from 10.0.1.41</title>
  <style>
    /* .img-card:hover {
      box-shadow: 0 4px 16px rgba(0,0,0,0.18);
      background: #2465c5;
      transform: scale(1.02);
      transform-origin: center;
      transition: box-shadow 0.25s, background 0.2s, transform 0.2s;
      max-width: none;
    } */
    .img-card {
      transition: box-shadow 0.2s, background 0.2s;
      margin-bottom: 24px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.07);
      padding: 16px;
      display: flex;
      flex-direction: column;
      max-width: 840px; 
      align-items: center;
    } 
    input[type="text"] {
      padding: 1px 8px;
      font-size: 16px;
      border: 2px solid #ccc;
      border-radius: 4px;
      margin: 2px 0;
      width: 40px;
      transition: border-color 0.3s ease;
    }

    input[type="text"]:focus {
      border-color: #007BFF;
      outline: none;
    }

    label {
      display: inline-block;
      margin-top: 10px;
      font-weight: bold;
      color: #333;
    }

  </style>
</head>
<body>
  <header id="top-header" style="position:fixed; top:0; left:0; right:0; height:64px; background:#a1e0db; box-shadow:0 2px 8px rgba(138, 112, 112, 0.08); z-index:10000; display:flex; align-items:center; padding:0 16px;">
    <h1 style="margin:0; font-size:1.25rem;">Images from 10.0.1.41</h1>
    <form id="imageForm" style="margin-bottom:12px;"></form>
      <label for="prefix">Prefix:</label>
      <input type="text" id="prefix" name="prefix" value="LAB" required>

      <label for="chap-index" style="margin-left:8px;">Chapter Index:</label>
      <input type="text" id="chap-index" name="chap-index" value="04" pattern="\\d{2}" required>

      <label for="start-index" style="margin-left:8px;">Image Index:</label>
      <input type="text" id="start-index" name="start-index" value="73" pattern="\\d{2}" required>

      <button id="load-images-btn" type="button">Load Images</button>
    </form>
    <p style="flex:1; margin:0; text-align:center;">Starting Filename: <span id="filename">LAB01-25.png</span></p>
    <a href="#" id="back-to-top" title="Back to top" aria-label="Back to top"
      style="text-decoration:none; color:#333; display:inline-flex; align-items:center; padding:8px; border-radius:6px;">
      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
       <polyline points="6 15 12 9 18 15"></polyline>
      </svg>
    </a>
    <script>
      document.getElementById('back-to-top').addEventListener('click', function(e){
        e.preventDefault();
        const duration = 600; // transition time in ms
        const start = window.scrollY || window.pageYOffset;
        const startTime = performance.now();
        const target = 0;
        const distance = target - start;
        const easeInOutCubic = t => t < 0.5 ? 4*t*t*t : 1 - Math.pow(-2*t+2, 3)/2;
        function step(now) {
          const elapsed = now - startTime;
          const progress = Math.min(elapsed / duration, 1);
          const eased = easeInOutCubic(progress);
          window.scrollTo(0, Math.round(start + distance * eased));
          if (elapsed < duration) requestAnimationFrame(step);
        }
        requestAnimationFrame(step);
      });
    </script></a>
  </header>

  <main style="margin-top:80px; padding:16px;">



    <div id="image-container">Loading...</div>
  </main>


<script>  
  const container = document.getElementById('image-container');
  container.innerHTML = '';
  let chapIndex = document.getElementById('chap-index').value;
  let chapName = `LAB${chapIndex}`;
  let startIndex = parseInt(document.getElementById('start-index').value, 10) || 0;  
  document.getElementById('load-images-btn').addEventListener('click', function() {
    container.innerHTML = '';
    startIndex = parseInt(document.getElementById('start-index').value, 10) || 0;
    tryLoadNextImage(startIndex);
  });
  function pad(num, length = 2) {
    return num.toString().padStart(length, '0');
  }
  function createImageCard(filename, url) {
    const card = document.createElement('div');
    const easeInOutCubic = t =>
      t < 0.5 ? 4 * t * t * t : 1 - Math.pow(-2 * t + 2, 3) / 2;

function smoothScale(element, targetScale = 1.2, duration = 500) {
  const startTime = performance.now();

  // ✅ Read current scale from transform (default to 1)
  const currentTransform = getComputedStyle(element).transform;
  let startScale = 1;
  if (currentTransform !== 'none') {
    const match = currentTransform.match(/matrix\(([^,]+),[^,]+,[^,]+,[^,]+,[^,]+,[^,]+\)/);
    if (match) startScale = parseFloat(match[1]);
  }

  const scaleDiff = targetScale - startScale;

  function step(now) {
    const elapsed = now - startTime;
    const progress = Math.min(elapsed / duration, 1);
    const eased = easeInOutCubic(progress);
    const currentScale = startScale + scaleDiff * eased;
    element.style.transformOrigin = 'top left';
    element.style.transform = `scale(${currentScale})`;

    if (elapsed < duration) requestAnimationFrame(step);
  }

  requestAnimationFrame(step);
}
    card.addEventListener('mouseenter', () => smoothScale(card, 1.6, 400));
    card.addEventListener('mouseleave', () => smoothScale(card, 1, 400));
    card.className = 'img-card';

    const title = document.createElement('div');
    title.textContent = filename;
    title.style.fontWeight = 'bold';
    title.style.marginBottom = '8px';
    title.style.fontSize = '1.4em';

    const img = document.createElement('img');
    img.src = url;
    img.alt = filename;
    img.style.display = 'block';
    img.style.width = '100%';
    img.style.borderRadius = '4px';

    card.appendChild(title);
    card.appendChild(img);

    card.style.cursor = 'pointer';
    card.addEventListener('click', function() {
      const modalBg = document.createElement('div');
      modalBg.style.position = 'fixed';
      modalBg.style.top = '0';
      modalBg.style.left = '0';
      modalBg.style.width = '100vw';
      modalBg.style.height = '100vh';
      modalBg.style.background = 'rgba(0,0,0,0.7)';
      modalBg.style.display = 'flex';
      modalBg.style.alignItems = 'center';
      modalBg.style.justifyContent = 'center';
      modalBg.style.zIndex = '9999';

      const modalImg = document.createElement('img');
      modalImg.src = url;
      modalImg.alt = filename;
      modalImg.style.maxWidth = '90vw';
      modalImg.style.maxHeight = '90vh';
      modalImg.style.boxShadow = '0 4px 32px rgba(0,0,0,0.5)';
      modalImg.style.background = '#fff';
      modalImg.style.borderRadius = '8px';

      modalBg.addEventListener('click', function(e) {
      if (e.target === modalBg) {
        document.body.removeChild(modalBg);
      }
      });

      modalBg.appendChild(modalImg);
      document.body.appendChild(modalBg);
    });    

    return card;
  }
  
  function tryLoadNextImage(index) {    
    const padNum = pad(index, index > 100 ? 3 : 2);
    const url = `http://10.0.1.41/${chapName}-${padNum}.PNG`;
    console.log(url);
    isImageUrlValid(url, function(isValid) {
      if (isValid) {
        const card = createImageCard(`${chapName}-${padNum}.PNG`, url);
        container.appendChild(card);
        // Add a divider line after the card
        const divider = document.createElement('hr');
        divider.style.width = '100%';
        divider.style.margin = '24px 0';
        container.appendChild(divider);        
        tryLoadNextImage(index + 1);
      }
    });
  }
  
  function isImageUrlValid(url, callback) {
    const img = new Image();

    img.onload = function() {
      callback(true);
    };

    img.onerror = function() {
      callback(false);
    };

    img.src = url;
  }

  const form = document.getElementById('imageForm');
  const filenameDisplay = document.getElementById('filename');

  form.addEventListener('input', () => {
    const prefix = form.prefix.value;
    const chapter = form.chapter.value.padStart(2, '0');
    const image = form.image.value.padStart(2, '0');

    // TODO: Uniform chapter index padding / format
    filenameDisplay.textContent = `${prefix}${chapter}-${image}.png`;
  });

  tryLoadNextImage(startIndex);
</script>

</body>
</html> 