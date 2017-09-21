.class public Lcom/boyaa/widget/LoadingDialog;
.super Landroid/app/AlertDialog;
.source "LoadingDialog.java"


# instance fields
.field private mAutoDismissRunnable:Ljava/lang/Runnable;

.field private mDisplayTime:J

.field private mText:Ljava/lang/String;

.field private mTextView:Landroid/widget/TextView;

.field private mUserCancelAble:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    const v0, 0x7f080003

    invoke-direct {p0, p1, v0}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 22
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/widget/LoadingDialog;->mUserCancelAble:Z

    .line 23
    const-wide/16 v0, 0x2710

    iput-wide v0, p0, Lcom/boyaa/widget/LoadingDialog;->mDisplayTime:J

    .line 135
    new-instance v0, Lcom/boyaa/widget/LoadingDialog$1;

    invoke-direct {v0, p0}, Lcom/boyaa/widget/LoadingDialog$1;-><init>(Lcom/boyaa/widget/LoadingDialog;)V

    iput-object v0, p0, Lcom/boyaa/widget/LoadingDialog;->mAutoDismissRunnable:Ljava/lang/Runnable;

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;J)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "displayTime"    # J

    .prologue
    .line 30
    const v0, 0x7f080003

    invoke-direct {p0, p1, v0}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 22
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/widget/LoadingDialog;->mUserCancelAble:Z

    .line 23
    const-wide/16 v0, 0x2710

    iput-wide v0, p0, Lcom/boyaa/widget/LoadingDialog;->mDisplayTime:J

    .line 135
    new-instance v0, Lcom/boyaa/widget/LoadingDialog$1;

    invoke-direct {v0, p0}, Lcom/boyaa/widget/LoadingDialog$1;-><init>(Lcom/boyaa/widget/LoadingDialog;)V

    iput-object v0, p0, Lcom/boyaa/widget/LoadingDialog;->mAutoDismissRunnable:Ljava/lang/Runnable;

    .line 31
    iput-wide p2, p0, Lcom/boyaa/widget/LoadingDialog;->mDisplayTime:J

    .line 32
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 17
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 38
    invoke-super/range {p0 .. p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    .line 39
    const v14, 0x7f030003

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/boyaa/widget/LoadingDialog;->setContentView(I)V

    .line 40
    const v14, 0x7f06001c

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/boyaa/widget/LoadingDialog;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/boyaa/widget/LoadingDialog;->mTextView:Landroid/widget/TextView;

    .line 41
    invoke-virtual/range {p0 .. p0}, Lcom/boyaa/widget/LoadingDialog;->getContext()Landroid/content/Context;

    move-result-object v14

    const-string v15, "window"

    invoke-virtual {v14, v15}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/view/WindowManager;

    .line 42
    .local v13, "wm":Landroid/view/WindowManager;
    invoke-interface {v13}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v8

    .line 43
    .local v8, "dis":Landroid/view/Display;
    invoke-virtual {v8}, Landroid/view/Display;->getHeight()I

    move-result v7

    .line 44
    .local v7, "curH":I
    mul-int/lit8 v14, v7, 0x38

    div-int/lit16 v2, v14, 0x320

    .line 45
    .local v2, "basePH":I
    mul-int/lit8 v14, v7, 0x20

    div-int/lit16 v1, v14, 0x320

    .line 46
    .local v1, "baseLM":I
    mul-int/lit8 v14, v7, 0x38

    div-int/lit16 v3, v14, 0x320

    .line 47
    .local v3, "baseRM":I
    mul-int/lit8 v14, v7, 0x10

    div-int/lit16 v4, v14, 0x320

    .line 48
    .local v4, "baseTM":I
    mul-int/lit8 v14, v7, 0x20

    div-int/lit16 v6, v14, 0x320

    .line 49
    .local v6, "baseTextS":I
    mul-int/lit8 v14, v7, 0x28

    div-int/lit16 v5, v14, 0x320

    .line 51
    .local v5, "baseTML":I
    const v14, 0x7f06001a

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/boyaa/widget/LoadingDialog;->findViewById(I)Landroid/view/View;

    move-result-object v12

    .line 52
    .local v12, "v":Landroid/view/View;
    const v14, 0x7f06001b

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/boyaa/widget/LoadingDialog;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/ProgressBar;

    .line 53
    .local v11, "pb":Landroid/widget/ProgressBar;
    invoke-virtual {v12, v1, v4, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 54
    invoke-virtual {v11}, Landroid/widget/ProgressBar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroid/widget/LinearLayout$LayoutParams;

    .line 55
    .local v9, "lp":Landroid/widget/LinearLayout$LayoutParams;
    iput v2, v9, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 56
    iput v2, v9, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 57
    invoke-virtual {v11, v9}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/boyaa/widget/LoadingDialog;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v14}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/widget/LinearLayout$LayoutParams;

    .line 59
    .local v10, "lp1":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v10, v5, v14, v15, v0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 60
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/boyaa/widget/LoadingDialog;->mTextView:Landroid/widget/TextView;

    const/4 v15, 0x0

    int-to-float v0, v6

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 62
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 128
    invoke-super {p0}, Landroid/app/AlertDialog;->onStop()V

    .line 129
    iget-object v0, p0, Lcom/boyaa/widget/LoadingDialog;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/boyaa/widget/LoadingDialog;->mTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/boyaa/widget/LoadingDialog;->mAutoDismissRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 133
    :cond_0
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 145
    iput-object p1, p0, Lcom/boyaa/widget/LoadingDialog;->mText:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public show()V
    .locals 4

    .prologue
    .line 119
    invoke-super {p0}, Landroid/app/AlertDialog;->show()V

    .line 120
    iget-boolean v0, p0, Lcom/boyaa/widget/LoadingDialog;->mUserCancelAble:Z

    if-nez v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/boyaa/widget/LoadingDialog;->mTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/boyaa/widget/LoadingDialog;->mAutoDismissRunnable:Ljava/lang/Runnable;

    iget-wide v2, p0, Lcom/boyaa/widget/LoadingDialog;->mDisplayTime:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 123
    :cond_0
    return-void
.end method

.method public showDialog()V
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/boyaa/widget/LoadingDialog;->mText:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/boyaa/widget/LoadingDialog;->showDialog(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public showDialog(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 71
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/boyaa/widget/LoadingDialog;->showDialog(Ljava/lang/String;Z)V

    .line 72
    return-void
.end method

.method public showDialog(Ljava/lang/String;Z)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "cancelAble"    # Z

    .prologue
    const/4 v3, -0x1

    .line 76
    iput-object p1, p0, Lcom/boyaa/widget/LoadingDialog;->mText:Ljava/lang/String;

    .line 77
    invoke-virtual {p0}, Lcom/boyaa/widget/LoadingDialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_0

    .line 78
    invoke-virtual {p0}, Lcom/boyaa/widget/LoadingDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 79
    .local v1, "win":Landroid/view/Window;
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 80
    .local v0, "layoutParams":Landroid/view/WindowManager$LayoutParams;
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 81
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 82
    const/16 v2, 0x400

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 83
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 85
    .end local v0    # "layoutParams":Landroid/view/WindowManager$LayoutParams;
    .end local v1    # "win":Landroid/view/Window;
    :cond_0
    iput-boolean p2, p0, Lcom/boyaa/widget/LoadingDialog;->mUserCancelAble:Z

    .line 86
    invoke-virtual {p0, p2}, Lcom/boyaa/widget/LoadingDialog;->setCancelable(Z)V

    .line 87
    invoke-virtual {p0, p2}, Lcom/boyaa/widget/LoadingDialog;->setCanceledOnTouchOutside(Z)V

    .line 88
    invoke-virtual {p0}, Lcom/boyaa/widget/LoadingDialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_1

    .line 89
    invoke-virtual {p0}, Lcom/boyaa/widget/LoadingDialog;->show()V

    .line 91
    :cond_1
    iget-object v2, p0, Lcom/boyaa/widget/LoadingDialog;->mText:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 92
    iget-object v2, p0, Lcom/boyaa/widget/LoadingDialog;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    :cond_2
    return-void
.end method

.method public showDialogForever(Ljava/lang/String;)V
    .locals 5
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 96
    iput-object p1, p0, Lcom/boyaa/widget/LoadingDialog;->mText:Ljava/lang/String;

    .line 97
    invoke-virtual {p0}, Lcom/boyaa/widget/LoadingDialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_0

    .line 98
    invoke-virtual {p0}, Lcom/boyaa/widget/LoadingDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 99
    .local v1, "win":Landroid/view/Window;
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 100
    .local v0, "layoutParams":Landroid/view/WindowManager$LayoutParams;
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 101
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 102
    const/16 v2, 0x400

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 103
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 106
    .end local v0    # "layoutParams":Landroid/view/WindowManager$LayoutParams;
    .end local v1    # "win":Landroid/view/Window;
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/boyaa/widget/LoadingDialog;->mUserCancelAble:Z

    .line 107
    invoke-virtual {p0, v4}, Lcom/boyaa/widget/LoadingDialog;->setCancelable(Z)V

    .line 108
    invoke-virtual {p0, v4}, Lcom/boyaa/widget/LoadingDialog;->setCanceledOnTouchOutside(Z)V

    .line 109
    invoke-virtual {p0}, Lcom/boyaa/widget/LoadingDialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_1

    .line 110
    invoke-virtual {p0}, Lcom/boyaa/widget/LoadingDialog;->show()V

    .line 112
    :cond_1
    iget-object v2, p0, Lcom/boyaa/widget/LoadingDialog;->mText:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 113
    iget-object v2, p0, Lcom/boyaa/widget/LoadingDialog;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    :cond_2
    return-void
.end method
