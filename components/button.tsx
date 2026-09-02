import type { ReactNode } from "react";

interface ButtonProps {
  children: ReactNode
  onClick?: () => void;
}

export function Button({ children, onClick }: ButtonProps) {
  return <button
    onClick={onClick}
    className="bg-[#9CC5A3] rounded-full px-4 py-2 text-[#232323] hover:bg-[#B5D4BA] transition-all duration-200 active:scale-95"
  >{children}</button>
}
