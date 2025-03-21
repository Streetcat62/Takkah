import { store } from "../redux/store";

export default function useSettings() {
  const { settings: { data, loading } = {} } = store.getState();
  if (loading) return { settings: {} };
  else return { settings: data };
}
