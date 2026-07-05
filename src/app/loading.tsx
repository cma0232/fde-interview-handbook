import OctopusLogo from "@/components/OctopusLogo";

export default function Loading() {
  return (
    <div className="octo-loader flex flex-1 flex-col items-center justify-center py-40">
      <OctopusLogo size={72} />
      <p className="mt-4 text-xs text-gray-400 font-mono">loading…</p>
    </div>
  );
}
