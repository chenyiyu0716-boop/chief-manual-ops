# Chief Manual Operations

Chief 是一套面向小型、多项目 AI 工作流的人工中控方法。

它解决的问题不是“让一个 Agent 自动接管所有工作”，而是：当 Owner 没有精力同时盯住多个项目时，如何用一个稳定的中控角色维持方向、边界、任务质量和可追溯决策，再把实施交给独立的执行窗口。

## 当前结论

```text
Owner
  ↓ 方向、关键标准、最终批准
Chief
  ↓ 项目目标、任务书、复审、裁定
Julius / Director / Control Plane / Eval
  ↓ 独立、隔离、人工启动
Executor windows
```

Chief 不是执行器，也不是后台守护进程。Chief 只参与：

- 与 Owner 对话，收束方向与验收标准；
- 读取项目仓库、状态和证据；
- 编写项目文档、任务书、复审意见与决策记录；
- 判断任务应继续、修订、合并、回滚还是封存；
- 保持多个项目之间的边界和优先级。

代码修改、测试、提交、合并、部署与回滚由人工启动的隔离 Executor 执行。任何执行结果都必须回到 Chief 复审，不能由 Executor 自验后直接进入生产。

## 为什么改为手工模式

我们验证过自动任务模型、状态机、租约、REVIEW 停点、隔离 clone、内核写边界和回滚机制；这些设计资产仍然有效。但对多种市售 Agent CLI 的真实接入实验显示，当前执行器在网络稳定性、无头认证、沙箱兼容、进程回收或机器可判输出方面不足以承担无人值守生产责任。

因此当前裁定是：

> 保留 Chief 的治理方法，封存自动执行器接入；以不同 Codex 任务窗口手工撰写方案，再由人工启动的执行窗口实施。

## 项目现状

| 项目 | 当前定位 | 当前阶段 |
| --- | --- | --- |
| Julius | 内容与知识生产系统 | 方向与编辑原则已固化；保持稳定，后续任务须服从主编判断 |
| Director | 内容生产工作台 | 持续开发；优先干净、稳定、真实健康状态，候选改动逐项复审后集成 |
| Control Plane | 任务治理与安全控制设计 | 自动执行接入已封存为 Design-only；保留 schema、状态机、REVIEW、隔离和回滚资产 |
| Eval | AI Agent 交付验收方法 | Phase 0；检查单体 Agent 的交付健康，不做排行、认证或代运营 |

详见 [项目现状](docs/PROJECT_STATUS.md)。

## 文档导航

- [设计理念](docs/DESIGN_PRINCIPLES.md)
- [角色与运行模型](docs/OPERATING_MODEL.md)
- [项目现状](docs/PROJECT_STATUS.md)
- [任务书契约](docs/TASK_BRIEF_CONTRACT.md)
- [复审与决策](docs/REVIEW_AND_DECISION.md)
- [自动化实验复盘](docs/AUTOMATION_RETROSPECTIVE.md)
- [手工 Chief 工作流](docs/MANUAL_WORKFLOW.md)
- [安全与脱敏](SECURITY.md)
- [Chief 方案窗口启动词](templates/CHIEF_SESSION_PROMPT.md)
- [Executor 任务书模板](templates/TASK_BRIEF_TEMPLATE.md)
- [Chief 复审模板](templates/CHIEF_REVIEW_TEMPLATE.md)
- [决策记录模板](templates/DECISION_RECORD_TEMPLATE.md)

## 一句话使用方式

在一个独立 Codex 任务中让 Chief 读取目标项目和当前证据、与 Owner 确认方向、产出任务书；再把任务书交给另一个隔离 Executor；Executor 交卷后回到 Chief 任务复审与裁定。

## 状态

`MANUAL / ACTIVE`：Chief 方法继续使用。
`AUTOMATED EXECUTOR / ARCHIVED`：无人值守派发与生产执行暂不继续。

提交或分享前可运行 `sh scripts/check-redaction.sh` 做基础敏感信息扫描。该扫描不能替代人工复核。
