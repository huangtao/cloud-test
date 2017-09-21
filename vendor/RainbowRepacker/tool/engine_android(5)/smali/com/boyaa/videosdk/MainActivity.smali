.class public Lcom/boyaa/videosdk/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field public RoomID:I

.field public btn_login:Landroid/widget/Button;

.field public btn_logout:Landroid/widget/Button;

.field public edit_uid:Landroid/widget/EditText;

.field public frametype:Landroid/widget/EditText;

.field public framevalue:Landroid/widget/EditText;

.field public iFarmeType:I

.field public iFrameValue:I

.field public mHandler:Landroid/os/Handler;

.field public mLayoutVideo:Landroid/widget/LinearLayout;

.field public roomType:I

.field public roomtype:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 30
    const/16 v0, 0xa

    iput v0, p0, Lcom/boyaa/videosdk/MainActivity;->RoomID:I

    .line 31
    iput v1, p0, Lcom/boyaa/videosdk/MainActivity;->iFarmeType:I

    .line 32
    iput v1, p0, Lcom/boyaa/videosdk/MainActivity;->iFrameValue:I

    .line 33
    iput v1, p0, Lcom/boyaa/videosdk/MainActivity;->roomType:I

    .line 85
    new-instance v0, Lcom/boyaa/videosdk/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/boyaa/videosdk/MainActivity$1;-><init>(Lcom/boyaa/videosdk/MainActivity;)V

    iput-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->mHandler:Landroid/os/Handler;

    .line 25
    return-void
.end method

.method private InitView()V
    .locals 1

    .prologue
    .line 73
    sget v0, Lcom/boyaa/videosdk/rtp/R$id;->roomtype:I

    invoke-virtual {p0, v0}, Lcom/boyaa/videosdk/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->roomtype:Landroid/widget/EditText;

    .line 74
    sget v0, Lcom/boyaa/videosdk/rtp/R$id;->framevalue:I

    invoke-virtual {p0, v0}, Lcom/boyaa/videosdk/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->framevalue:Landroid/widget/EditText;

    .line 75
    sget v0, Lcom/boyaa/videosdk/rtp/R$id;->frametype:I

    invoke-virtual {p0, v0}, Lcom/boyaa/videosdk/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->frametype:Landroid/widget/EditText;

    .line 76
    sget v0, Lcom/boyaa/videosdk/rtp/R$id;->edit_uid:I

    invoke-virtual {p0, v0}, Lcom/boyaa/videosdk/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->edit_uid:Landroid/widget/EditText;

    .line 78
    sget v0, Lcom/boyaa/videosdk/rtp/R$id;->btn_login:I

    invoke-virtual {p0, v0}, Lcom/boyaa/videosdk/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->btn_login:Landroid/widget/Button;

    .line 79
    sget v0, Lcom/boyaa/videosdk/rtp/R$id;->btn_logout:I

    invoke-virtual {p0, v0}, Lcom/boyaa/videosdk/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->btn_logout:Landroid/widget/Button;

    .line 80
    sget v0, Lcom/boyaa/videosdk/rtp/R$id;->layout_video:I

    invoke-virtual {p0, v0}, Lcom/boyaa/videosdk/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->mLayoutVideo:Landroid/widget/LinearLayout;

    .line 83
    return-void
.end method


# virtual methods
.method protected AddView(I)V
    .locals 8
    .param p1, "i"    # I

    .prologue
    const/4 v7, 0x0

    .line 132
    iget-object v5, p0, Lcom/boyaa/videosdk/MainActivity;->mLayoutVideo:Landroid/widget/LinearLayout;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    .line 133
    .local v4, "view":Landroid/view/View;
    if-eqz v4, :cond_0

    .line 134
    iget-object v5, p0, Lcom/boyaa/videosdk/MainActivity;->mLayoutVideo:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 138
    :cond_0
    const/4 v1, 0x0

    .local v1, "iW":I
    const/4 v0, 0x0

    .line 139
    .local v0, "iH":I
    packed-switch p1, :pswitch_data_0

    .line 163
    :goto_0
    new-instance v3, Lcom/boyaa/videodemo/utils/VideoView1;

    invoke-direct {v3, p0, v1, v0, p1}, Lcom/boyaa/videodemo/utils/VideoView1;-><init>(Landroid/content/Context;III)V

    .line 165
    .local v3, "videoView":Lcom/boyaa/videodemo/utils/VideoView1;
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/boyaa/videodemo/utils/VideoView1;->setTag(Ljava/lang/Object;)V

    .line 166
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x5a

    const/16 v6, 0x78

    invoke-direct {v2, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 167
    .local v2, "params2":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v5, 0xa

    invoke-virtual {v2, v5, v7, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 168
    invoke-virtual {v3, v2}, Lcom/boyaa/videodemo/utils/VideoView1;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 169
    iget-object v5, p0, Lcom/boyaa/videosdk/MainActivity;->mLayoutVideo:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 170
    return-void

    .line 142
    .end local v2    # "params2":Landroid/widget/LinearLayout$LayoutParams;
    .end local v3    # "videoView":Lcom/boyaa/videodemo/utils/VideoView1;
    :pswitch_0
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v5

    iget v5, v5, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType1:I

    if-nez v5, :cond_1

    .line 144
    const/16 v1, 0x160

    const/16 v0, 0x120

    .line 145
    goto :goto_0

    .line 148
    :cond_1
    const/16 v1, 0x280

    const/16 v0, 0x1e0

    .line 150
    goto :goto_0

    .line 152
    :pswitch_1
    invoke-static {}, Lcom/boyaa/videodemo/utils/CacheRef;->getInstance()Lcom/boyaa/videodemo/utils/CacheRef;

    move-result-object v5

    iget v5, v5, Lcom/boyaa/videodemo/utils/CacheRef;->mFrameType2:I

    if-nez v5, :cond_2

    .line 154
    const/16 v1, 0x160

    const/16 v0, 0x120

    .line 155
    goto :goto_0

    .line 158
    :cond_2
    const/16 v1, 0x280

    const/16 v0, 0x1e0

    goto :goto_0

    .line 139
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    sget v0, Lcom/boyaa/videosdk/rtp/R$layout;->activity_main:I

    invoke-virtual {p0, v0}, Lcom/boyaa/videosdk/MainActivity;->setContentView(I)V

    .line 39
    invoke-direct {p0}, Lcom/boyaa/videosdk/MainActivity;->InitView()V

    .line 43
    iget-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->btn_login:Landroid/widget/Button;

    new-instance v1, Lcom/boyaa/videosdk/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/boyaa/videosdk/MainActivity$2;-><init>(Lcom/boyaa/videosdk/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    iget-object v0, p0, Lcom/boyaa/videosdk/MainActivity;->btn_logout:Landroid/widget/Button;

    new-instance v1, Lcom/boyaa/videosdk/MainActivity$3;

    invoke-direct {v1, p0}, Lcom/boyaa/videosdk/MainActivity$3;-><init>(Lcom/boyaa/videosdk/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    return-void
.end method
