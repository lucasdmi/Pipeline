import { render, screen } from '@testing-library/react';
import App from './App';

test('renders welcome message', () => {
  render(<App />);
  const linkElement = screen.getByText(/Bem-vindo ao Melhor Frontend!/i);
  expect(linkElement).toBeInTheDocument();
});
