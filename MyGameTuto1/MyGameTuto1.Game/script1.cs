using System.Threading.Tasks;
using SiliconStudio.Paradox.Engine;
using SiliconStudio.Core.Mathematics;
using SiliconStudio.Paradox.Animations;
using SiliconStudio.Paradox.Assets;
using SiliconStudio.Paradox;
using SiliconStudio.Paradox.Input;
using SiliconStudio.Paradox.Games;
using SiliconStudio.Paradox.UI;
using SiliconStudio.Paradox.SpriteStudio;
using SiliconStudio.Paradox.Extensions;
using SiliconStudio.Paradox.Graphics;
using SiliconStudio.Paradox.Physics;
using SiliconStudio.Paradox.Rendering;
using SiliconStudio.Paradox.Shaders;
using System.Windows.Input;
using MyGameTuto1;
using System.Linq;
using System;

namespace MyGame
{
   /* public class script1 : AsyncScript
    {
        public override async Task Execute()
        {
            while (Game.IsRunning)
            {
               
            }
        }
    }*/
    

    public class AnimationScript : SyncScript
    {
        // Note: making those two field public allows you to override
        // the default animation names from the editor for each instance of the script
        public string DefaultAnimation = "Idle";
        public string AlternativeAnimation = "Run";
        public Entity knight;

        private string currentAnimation;
        private string runAnimation;

        public override void Start()
        {
            base.Start();

            // Start the default animation here
            currentAnimation = DefaultAnimation;
            runAnimation = AlternativeAnimation;
            Entity.Get<AnimationComponent>().Play(currentAnimation);
        }

        public override void Update()
        {
            //Perform crossfading between the two animations when user touch the screen
            if(Input.PointerEvents.Any(e => e.State == PointerState.Up))
            {
                //currentAnimation = currentAnimation == DefaultAnimation ? AlternativeAnimation : DefaultAnimation;
                
                //Entity.Transform.Rotation = Quaternion.Rotation((float)Game.UpdateTime.Total.TotalSeconds);
                
            }
            if(Input.PointerEvents.Any(e => e.State == PointerState.Down))
            {
                //currentAnimation = currentAnimation == DefaultAnimation ? AlternativeAnimation : DefaultAnimation;
                Entity.Get<AnimationComponent>().Crossfade(runAnimation, TimeSpan.FromMilliseconds(500));
                //Entity.Transform.Position = Quaternion.
                

            }

            if (Input.IsKeyDown(SiliconStudio.Paradox.Input.Keys.Up))
            {
                Entity.Get<AnimationComponent>().Crossfade(runAnimation, TimeSpan.FromMilliseconds(500));
                this.Entity.Transform.Position.Z += 0.1f;
            }
            if (Input.IsKeyReleased(SiliconStudio.Paradox.Input.Keys.Up))
            {
                Entity.Get<AnimationComponent>().Crossfade(currentAnimation, TimeSpan.FromMilliseconds(500));
            }
            if (Input.IsKeyDown(SiliconStudio.Paradox.Input.Keys.Down))
            {
                Entity.Get<AnimationComponent>().Crossfade(runAnimation, TimeSpan.FromMilliseconds(500));
                this.Entity.Transform.Position.Z -= 0.1f;
            }
            if (Input.IsKeyReleased(SiliconStudio.Paradox.Input.Keys.Down))
            {
                Entity.Get<AnimationComponent>().Crossfade(currentAnimation, TimeSpan.FromMilliseconds(500));
            }




            if (Input.IsKeyDown(SiliconStudio.Paradox.Input.Keys.Left))
            {
                Entity.Get<AnimationComponent>().Crossfade(runAnimation, TimeSpan.FromMilliseconds(500));
                this.Entity.Transform.Position.X += 0.1f;
            }
            if (Input.IsKeyReleased(SiliconStudio.Paradox.Input.Keys.Left))
            {
                Entity.Get<AnimationComponent>().Crossfade(currentAnimation, TimeSpan.FromMilliseconds(500));
            }
            if (Input.IsKeyDown(SiliconStudio.Paradox.Input.Keys.Right))
            {
                Entity.Get<AnimationComponent>().Crossfade(runAnimation, TimeSpan.FromMilliseconds(500));
                this.Entity.Transform.Position.X -= 0.1f;
            }
            if (Input.IsKeyReleased(SiliconStudio.Paradox.Input.Keys.Right))
            {
                Entity.Get<AnimationComponent>().Crossfade(currentAnimation, TimeSpan.FromMilliseconds(500));
            }
        }
    }
}