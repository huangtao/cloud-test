.class final Lcom/boyaa/engine/made/AppEditBoxView$4;
.super Ljava/lang/Object;
.source "AppEditBoxView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppEditBoxView;->open([BI[BIIIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$b:I

.field final synthetic val$fontSize:I

.field final synthetic val$fontname:[B

.field final synthetic val$g:I

.field final synthetic val$h:I

.field final synthetic val$maxLen:I

.field final synthetic val$r:I

.field final synthetic val$text:[B

.field final synthetic val$w:I

.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>([B[BIIIIIIIII)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$text:[B

    iput-object p2, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$fontname:[B

    iput p3, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$maxLen:I

    iput p4, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$fontSize:I

    iput p5, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$r:I

    iput p6, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$g:I

    iput p7, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$b:I

    iput p8, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$x:I

    iput p9, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$y:I

    iput p10, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$w:I

    iput p11, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$h:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 150
    const-string v2, ""

    .line 151
    .local v2, "content":Ljava/lang/String;
    const-string v4, ""

    .line 152
    .local v4, "font":Ljava/lang/String;
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$text:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$text:[B

    array-length v0, v0

    if-lez v0, :cond_0

    .line 153
    new-instance v2, Ljava/lang/String;

    .end local v2    # "content":Ljava/lang/String;
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$text:[B

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    .line 155
    .restart local v2    # "content":Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$fontname:[B

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$fontname:[B

    array-length v0, v0

    if-lez v0, :cond_1

    .line 156
    new-instance v4, Ljava/lang/String;

    .end local v4    # "font":Ljava/lang/String;
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$fontname:[B

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([B)V

    .line 158
    .restart local v4    # "font":Ljava/lang/String;
    :cond_1
    sget-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    if-eqz v0, :cond_2

    .line 159
    sget-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->delete()V

    .line 161
    :cond_2
    new-instance v0, Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v1

    iget v3, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$maxLen:I

    iget v5, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$fontSize:I

    iget v6, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$r:I

    iget v7, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$g:I

    iget v8, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$b:I

    iget v9, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$x:I

    iget v10, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$y:I

    iget v11, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$w:I

    iget v12, p0, Lcom/boyaa/engine/made/AppEditBoxView$4;->val$h:I

    const/4 v13, 0x0

    invoke-direct/range {v0 .. v13}, Lcom/boyaa/engine/made/AppEditBoxView;-><init>(Lcom/boyaa/engine/made/AppActivity;Ljava/lang/String;ILjava/lang/String;IIIIIIIILcom/boyaa/engine/made/AppEditBoxView$1;)V

    sput-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    .line 163
    sget-object v0, Lcom/boyaa/engine/made/AppEditBoxView;->mInstance:Lcom/boyaa/engine/made/AppEditBoxView;

    # invokes: Lcom/boyaa/engine/made/AppEditBoxView;->show()V
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->access$500(Lcom/boyaa/engine/made/AppEditBoxView;)V

    .line 164
    return-void
.end method
