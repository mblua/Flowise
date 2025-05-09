import { L as LogsPanel } from "./LogsPanel-zIrTNE6j.js";
import { d as defineComponent, p as useSettingsStore, U as useWorkflowsStore, q as computed, e as createBlock, f as createCommentVNode, m as unref, g as openBlock } from "./index-BpdkKRP4.js";
import "./useClearExecutionButtonVisible-D_0O6f0X.js";
import "./useCanvasOperations-D6VFiC3b.js";
import "./RunData-Ds-U68nr.js";
import "./FileSaver.min-Cm0u4qyc.js";
import "./useExecutionHelpers-DN5HqPqY.js";
import "./dateFormatter-CZI1kGYK.js";
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "DemoFooter",
  setup(__props) {
    const { isNewLogsEnabled } = useSettingsStore();
    const workflowsStore = useWorkflowsStore();
    const hasExecutionData = computed(() => workflowsStore.workflowExecutionData);
    return (_ctx, _cache) => {
      return unref(isNewLogsEnabled) && hasExecutionData.value ? (openBlock(), createBlock(LogsPanel, {
        key: 0,
        "is-read-only": true
      })) : createCommentVNode("", true);
    };
  }
});
export {
  _sfc_main as default
};
