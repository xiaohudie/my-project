# Personal Website

A personal website built with Vue.js and Material Design 3, featuring a resume viewer, portfolio showcase, and interactive elements.

## Features

- Modern UI with Material Design 3 components
- PDF resume viewer
- Portfolio showcase
- Interactive elements with animations
- Responsive design
- Theme color customization

## Prerequisites

- Node.js (v14 or higher)
- npm (v6 or higher)

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```
3. Place your resume PDF file in the `public` directory as `resume.pdf`
4. Add your project images to the `public` directory

## Development

To run the development server:

```bash
npm run dev
```

The application will be available at `http://localhost:3000`

## Production

To build for production:

```bash
npm run build
```

To start the production server:

```bash
npm start
```

## Project Structure

```
├── public/
│   ├── index.html
│   ├── resume.pdf
│   └── project-images/
├── src/
│   ├── App.vue
│   ├── main.js
│   ├── router/
│   │   └── index.js
│   └── views/
│       ├── Home.vue
│       ├── Portfolio.vue
│       └── Fun.vue
├── package.json
├── webpack.config.js
└── server.js
```

## Technologies Used

- Vue.js 3
- Material Design 3
- Webpack
- Express.js
- GSAP (for animations)
- PDF.js (for PDF viewing) 