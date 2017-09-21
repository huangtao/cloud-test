.class Lcom/boyaa/engine/made/AppEffect$1;
.super Ljava/lang/Object;
.source "AppEffect.java"

# interfaces
.implements Landroid/media/SoundPool$OnLoadCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppEffect;->setOnLoadCompleteListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/made/AppEffect;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppEffect;)V
    .locals 0

    .prologue
    .line 59
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEffect$1;->this$0:Lcom/boyaa/engine/made/AppEffect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadComplete(Landroid/media/SoundPool;II)V
    .locals 11
    .param p1, "soundPool"    # Landroid/media/SoundPool;
    .param p2, "sampleId"    # I
    .param p3, "status"    # I

    .prologue
    .line 64
    if-nez p3, :cond_1

    .line 65
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect$1;->this$0:Lcom/boyaa/engine/made/AppEffect;

    # getter for: Lcom/boyaa/engine/made/AppEffect;->mAutoPlayCustomIDArray:Ljava/util/Set;
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEffect;->access$000(Lcom/boyaa/engine/made/AppEffect;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 67
    .local v9, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    :cond_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 68
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 69
    .local v7, "customID":I
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect$1;->this$0:Lcom/boyaa/engine/made/AppEffect;

    # invokes: Lcom/boyaa/engine/made/AppEffect;->getItem(I)Lcom/boyaa/engine/made/AppEffect$SoundItem;
    invoke-static {v0, v7}, Lcom/boyaa/engine/made/AppEffect;->access$100(Lcom/boyaa/engine/made/AppEffect;I)Lcom/boyaa/engine/made/AppEffect$SoundItem;

    move-result-object v8

    .line 70
    .local v8, "item":Lcom/boyaa/engine/made/AppEffect$SoundItem;
    if-eqz v8, :cond_0

    iget v0, v8, Lcom/boyaa/engine/made/AppEffect$SoundItem;->soundID:I

    if-ne v0, p2, :cond_0

    .line 72
    invoke-interface {v9}, Ljava/util/Iterator;->remove()V

    .line 73
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect$1;->this$0:Lcom/boyaa/engine/made/AppEffect;

    # getter for: Lcom/boyaa/engine/made/AppEffect;->mVolume:F
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEffect;->access$200(Lcom/boyaa/engine/made/AppEffect;)F

    move-result v2

    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect$1;->this$0:Lcom/boyaa/engine/made/AppEffect;

    # getter for: Lcom/boyaa/engine/made/AppEffect;->mVolume:F
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEffect;->access$200(Lcom/boyaa/engine/made/AppEffect;)F

    move-result v3

    const/4 v4, 0x5

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p1

    move v1, p2

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v10

    .line 76
    .local v10, "streamID":I
    iput v10, v8, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    .line 81
    .end local v7    # "customID":I
    .end local v8    # "item":Lcom/boyaa/engine/made/AppEffect$SoundItem;
    .end local v9    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    .end local v10    # "streamID":I
    :cond_1
    return-void
.end method
